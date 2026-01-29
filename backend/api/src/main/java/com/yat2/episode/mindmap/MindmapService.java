package com.yat2.episode.mindmap;

import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.mindmap.dto.MindmapArgsReqDto;
import com.yat2.episode.mindmap.dto.MindmapCreatedWithUrlDto;
import com.yat2.episode.mindmap.dto.MindmapDataDto;
import com.yat2.episode.mindmap.dto.MindmapIdentityDto;
import com.yat2.episode.users.Users;
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

    @Transactional
    public MindmapCreatedWithUrlDto createMindmap(Long userId, MindmapArgsReqDto body){
        //todo: title과 shared 값을 기반으로 defaultTitle 생성
        //todo: 입력 값 기반 mindmap 데이터를 db에 저장
        //todo: 사용자와 mindmap 사이 참여 관계를 MindmapParticipant에 저장
        //todo: mindmap uuid 기반 s3의 presigned URL 셍성
        //todo: 생성된 모든 값을 기반으로 하여 응답 생성
        return new MindmapCreatedWithUrlDto(null, null);
    }

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
}
