package com.yat2.episode.mindmap;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.mindmap.constants.MindmapConstants;
import com.yat2.episode.mindmap.dto.MindmapArgsReqDto;
import com.yat2.episode.mindmap.dto.MindmapCreatedWithUrlDto;
import com.yat2.episode.mindmap.dto.MindmapDataDto;
import com.yat2.episode.mindmap.dto.MindmapDataExceptDateDto;
import com.yat2.episode.mindmap.dto.MindmapIdentityDto;
import com.yat2.episode.mindmap.s3.S3SnapshotRepository;
import com.yat2.episode.user.User;
import com.yat2.episode.user.UserService;

@RequiredArgsConstructor
@Service
public class MindmapService {
    private final MindmapRepository mindmapRepository;
    private final MindmapParticipantRepository mindmapParticipantRepository;
    private final S3SnapshotRepository snapshotRepository;
    private final UserService userService;

    public MindmapDataDto getMindmapById(Long userId, String mindmapIdStr) {
        return MindmapDataDto.of(getMindmapByUUIDString(userId, mindmapIdStr));
    }

    @Transactional(readOnly = true)
    public List<MindmapDataDto> getMindmaps(Long userId, MindmapController.MindmapVisibility type) {
        return switch (type) {
            case PRIVATE -> getMindmapsByShared(userId, false);
            case PUBLIC -> getMindmapsByShared(userId, true);
            default -> getAllMindmap(userId);
        };
    }

    private List<MindmapDataDto> getMindmapsByShared(Long userId, boolean shared) {
        return mindmapParticipantRepository.findByUserIdAndSharedOrderByFavoriteAndUpdatedDesc(userId, shared)
                .stream()
                .map(MindmapDataDto::of)
                .toList();
    }

    private List<MindmapDataDto> getAllMindmap(Long userId) {
        return mindmapParticipantRepository.findByUserIdOrderByFavoriteAndUpdatedDesc(userId)
                .stream()
                .map(MindmapDataDto::of)
                .toList();
    }


    @Transactional(readOnly = true)
    public List<MindmapIdentityDto> getMindmapList(Long userId) {
        return mindmapRepository.findByUserIdOrderByCreatedDesc(userId)
                .stream()
                .map(MindmapIdentityDto::of)
                .toList();
    }


    @Transactional
    public MindmapDataExceptDateDto saveMindmapAndParticipant(long userId, MindmapArgsReqDto body) {
        User user = userService.getUserOrThrow(userId);
        String finalTitle = body.title();
        if (finalTitle == null || finalTitle.isBlank()) {
            if (body.isShared()) throw new CustomException(ErrorCode.MINDMAP_TITLE_REQUIRED);
            finalTitle = getPrivateMindmapName(user);
        }

        Mindmap mindmap = new Mindmap(finalTitle, body.isShared());
        mindmapRepository.save(mindmap);

        MindmapParticipant participant = new MindmapParticipant(user, mindmap);
        mindmapParticipantRepository.save(participant);

        return MindmapDataExceptDateDto.of(participant);
    }

    @Transactional
    public void rollbackMindmap(UUID mindmapId) {
        mindmapRepository.findById(mindmapId).ifPresent(mindmapRepository::delete);
    }

    public MindmapCreatedWithUrlDto getUploadInfo(MindmapDataExceptDateDto mindmapDatas) {
        Map<String, String> uploadInfo =
                snapshotRepository.createPresignedUploadInfo("maps/" + mindmapDatas.mindmapId());
        return new MindmapCreatedWithUrlDto(mindmapDatas, uploadInfo);
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


    public MindmapParticipant getMindmapByUUIDString(Long userId, String uuidStr) {
        return findParticipantOrThrow(uuidStr, userId);
    }

    private String getPrivateMindmapName(User user) {
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


    @Transactional
    public void deleteMindmap(long userId, String mindmapId) {
        UUID mindmapUUID = getUUID(mindmapId);

        Mindmap mindmap = mindmapRepository.findByIdWithLock(mindmapUUID)
                .orElseThrow(() -> new CustomException(ErrorCode.MINDMAP_NOT_FOUND));

        int deletedCount = mindmapParticipantRepository.deleteByMindmap_IdAndUser_KakaoId(mindmapUUID, userId);
        if (deletedCount == 0) throw new CustomException(ErrorCode.MINDMAP_NOT_FOUND);

        boolean hasOtherParticipants = mindmapParticipantRepository.existsByMindmap_Id(mindmapUUID);

        if (!hasOtherParticipants) {
            mindmapRepository.delete(mindmap);
        }
    }

    @Transactional
    public MindmapDataDto updateFavoriteStatus(long userId, String mindmapId, boolean status) {
        MindmapParticipant participant = findParticipantOrThrow(mindmapId, userId);
        participant.updateFavorite(status);

        return MindmapDataDto.of(participant);
    }

    private MindmapParticipant findParticipantOrThrow(String mindmapId, long userId) {
        return mindmapParticipantRepository
                .findByMindmapIdAndUserId(getUUID(mindmapId), userId)
                .orElseThrow(() -> new CustomException(ErrorCode.MINDMAP_NOT_FOUND));
    }

    public URI getCreatedURI(UUID mindmapId) {
        return ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{mindmapId}")
                .buildAndExpand(mindmapId)
                .toUri();
    }
}
