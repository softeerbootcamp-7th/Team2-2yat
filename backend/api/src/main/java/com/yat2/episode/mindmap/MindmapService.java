package com.yat2.episode.mindmap;

import com.yat2.episode.mindmap.constants.MindmapConstants;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.mindmap.dto.*;
import com.yat2.episode.mindmap.s3.S3SnapshotRepository;
import com.yat2.episode.users.Users;
import com.yat2.episode.users.UsersRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@RequiredArgsConstructor
@Transactional(readOnly = true)
@Service
public class MindmapService {
    private final MindmapRepository mindmapRepository;
    private final MindmapParticipantRepository mindmapParticipantRepository;
    private final UsersRepository usersRepository;
    private final S3SnapshotRepository snapshotRepository;
    private final TransactionTemplate transactionTemplate;

    public MindmapDataDto getMindmapById(Long userId, String mindmapIdStr) {
        return MindmapDataDto.of(getMindmapByUUIDString(userId, mindmapIdStr));
    }

    public List<MindmapDataDto> getMindmaps(Long userId, MindmapController.MindmapVisibility type) {
        return switch (type) {
            case PRIVATE -> getMindmapsByShared(userId, false);
            case PUBLIC -> getMindmapsByShared(userId, true);
            default -> getAllMindmap(userId);
        };
    }

    private List<MindmapDataDto> getMindmapsByShared(Long userId, boolean shared) {
        return mindmapRepository.findByUserIdAndSharedOrderByFavoriteAndUpdatedDesc(userId, shared)
                .stream()
                .map(MindmapDataDto::of)
                .toList();
    }

    private List<MindmapDataDto> getAllMindmap(Long userId) {
        return mindmapRepository.findByUserIdOrderByFavoriteAndUpdatedDesc(userId)
                .stream()
                .map(MindmapDataDto::of)
                .toList();
    }


    public List<MindmapIdentityDto> getMindmapList(Long userId) {
        return mindmapRepository.findByUserIdOrderByCreatedDesc(userId)
                .stream()
                .map(MindmapIdentityDto::of)
                .toList();
    }

    @Transactional
    public MindmapCreatedWithUrlDto createMindmap(Long userId, MindmapArgsReqDto body) {
        Users user = usersRepository.findByKakaoId(userId)
                .orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));

        Mindmap savedMindmap = transactionTemplate.execute(status -> {
            String finalTitle = body.title();
            if (finalTitle == null || finalTitle.isBlank()) {
                if (body.isShared()) throw new CustomException(ErrorCode.MINDMAP_TITLE_REQUIRED);
                finalTitle = getPrivateMindmapName(user);
            }

            Mindmap mindmap = new Mindmap(finalTitle, body.isShared());
            Mindmap saved = mindmapRepository.save(mindmap);

            MindmapParticipant participant = new MindmapParticipant(user, saved);
            mindmapParticipantRepository.save(participant);

            return saved;
        });
        try {
            Map<String, String> uploadInfo = snapshotRepository.createPresignedUploadInfo("maps/" + savedMindmap.getId());
            return new MindmapCreatedWithUrlDto(MindmapDataExceptDateDto.of(savedMindmap), uploadInfo);
        } catch (Exception e) {
            mindmapRepository.delete(savedMindmap);
            throw new CustomException(ErrorCode.S3_URL_FAIL);
        }
    }

    //todo: S3로 스냅샷이 들어오지 않거나.. 잘못된 데이터가 들어온 경우 체크 후 db에서 삭제
    //todo: disconnect 시 마인드맵 웹소켓 연결 수가 0인 경우의 s3 데이터에 스냅샷 업로드
    //todo: delete 시 해당 마인드맵의 mindmap_participant가 0인 경우 db 내 마인드맵 데이터 삭제

    private UUID getUUID(String uuidStr) {
        try {
            return UUID.fromString(uuidStr);
        } catch (IllegalArgumentException e) {
            throw new CustomException(ErrorCode.INVALID_MINDMAP_UUID);
        }
    }

    public Mindmap getMindmapByUUIDString(Long userId, String uuidStr) {
        UUID mindmapId = getUUID(uuidStr);
        return mindmapRepository.findByIdAndUserId(mindmapId, userId)
                .orElseThrow(() -> new CustomException(ErrorCode.MINDMAP_NOT_FOUND));
    }

    private String getPrivateMindmapName(Users user) {
        String baseName = user.getNickname() + MindmapConstants.PRIVATE_NAME;
        List<String> allNames = mindmapRepository.findAllNamesByBaseName(baseName, user.getKakaoId());

        if (allNames.isEmpty()) {
            return baseName;
        }
        int maxNum = -1;
        boolean baseNameExists = false;
        String prefixWithBracket = baseName + "(";

        for (String name : allNames) {
            if (name.equals(baseName)) {
                baseNameExists = true;
                continue;
            }

            if (name.startsWith(prefixWithBracket) && name.endsWith(")")) {
                try {
                    String numPart = name.substring(prefixWithBracket.length(), name.length() - 1);
                    maxNum = Math.max(maxNum, Integer.parseInt(numPart));
                } catch (NumberFormatException e) {
                }
            }
        }
        if (!baseNameExists) {
            return baseName;
        }
        StringBuilder sb = new StringBuilder(baseName);
        if (maxNum == -1) {
            sb.append("(1)");
        } else {
            sb.append("(").append(maxNum + 1).append(")");
        }

        return sb.toString();
    }

}
