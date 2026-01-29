package com.yat2.episode.mindmap;

import com.yat2.episode.global.constant.MindmapConstants;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.mindmap.dto.MindmapArgsReqDto;
import com.yat2.episode.mindmap.dto.MindmapCreatedWithUrlDto;
import com.yat2.episode.mindmap.dto.MindmapDataDto;
import com.yat2.episode.mindmap.dto.MindmapIdentityDto;
import com.yat2.episode.users.Users;
import com.yat2.episode.users.UsersRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RequiredArgsConstructor
@Service
public class MindmapService {
    private final MindmapRepository mindmapRepository;
    private final MindmapParticipantRepository mindmapParticipantRepository;
    private final UsersRepository usersRepository;

    public MindmapDataDto getMindmapById(Long userId, String mindmapIdStr) {
        return MindmapDataDto.of(getMindmapByUUIDString(userId, mindmapIdStr));
    }

    public void validAccessMindmap(Long userId, String uuidStr){
        UUID uuid = getUUID(uuidStr);

        mindmapParticipantRepository.findByMindmapIdAndUserId(uuid, userId)
                .orElseThrow(()->new CustomException(ErrorCode.MINDMAP_NOT_FOUND));
    }

    public List<MindmapDataDto> getMindmaps(Long userId, MindmapController.MindmapVisibility type) {
        return switch (type) {
            case PRIVATE -> getMindmapsByShared(userId, false);
            case PUBLIC  -> getMindmapsByShared(userId, true);
            default      -> getAllMindmap(userId);
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

    @Transactional(rollbackFor = Exception.class)
    public MindmapCreatedWithUrlDto createMindmap(Long userId, MindmapArgsReqDto body){
        String finalTitle = body.title();
        Users user = usersRepository.findByKakaoId(userId)
                .orElseThrow(()-> new CustomException(ErrorCode.USER_NOT_FOUND));

        if (body.isShared()) {
            if (finalTitle == null || finalTitle.isBlank()) {
                throw new CustomException(ErrorCode.MINDMAP_TITLE_REQUIRED);
            }
        }
        else {
            if (finalTitle == null || finalTitle.isBlank()) {
                finalTitle = getPrivateMindmapName(user);
            }
        }

        Mindmap mindmap = Mindmap.builder()
                .name(finalTitle)
                .shared(body.isShared())
                .isFavorite(false)
                .build();

        Mindmap savedMindmap = mindmapRepository.save(mindmap);
        
        MindmapParticipant participant = MindmapParticipant.builder()
                .user(user).mindmap(mindmap).build();

        mindmapParticipantRepository.save(participant);
        //todo: mindmap uuid 기반 s3의 presigned URL 셍성

        return new MindmapCreatedWithUrlDto(MindmapDataDto.of(savedMindmap), null);
    }

    //todo: presignedURL 작성 함수
    //todo: S3로 스냅샷이 들어오지 않거나.. 잘못된 데이터가 들어온 경우 체크 후 db에서 삭제
    //todo: disconnect 시 마인드맵 참여자가 0인 경우의 s3 데이터와 db 내 마인드맵 데이터 삭제

    private UUID getUUID(String uuidStr){
        try {
            return UUID.fromString(uuidStr);
        } catch (IllegalArgumentException e) {
            throw new CustomException(ErrorCode.INVALID_MINDMAP_UUID);
        }
    }

    private Mindmap getMindmapByUUIDString(Long userId, String uuidStr){
        UUID mindmapId = getUUID(uuidStr);
        return mindmapRepository.findByIdAndUserId(mindmapId, userId)
                .orElseThrow(() -> new CustomException(ErrorCode.MINDMAP_NOT_FOUND));
    }

    private String getPrivateMindmapName(Users user){
        StringBuilder sb = new StringBuilder(user.getNickname())
                .append(MindmapConstants.PRIVATE_NAME);
        Long count = mindmapRepository.getCountSameNameByNameAndUserId(sb.toString(), user.getKakaoId());
        sb.append("(")
        .append(count)
        .append(")");
        return sb.toString();
    }

}
