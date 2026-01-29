package com.yat2.episode.mindmap;

import com.yat2.episode.mindmap.dto.MindmapDataDto;
import com.yat2.episode.mindmap.dto.MindmapIdentityDto;
import com.yat2.episode.users.Users;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RequiredArgsConstructor
@Service
public class MindmapService {
    private final MindmapRepository mindmapRepository;
    private final MindmapParticipantRepository mindmapParticipantRepository;

    public Optional<Mindmap> getMindmapById(String mindmapIdStr) {
        try {
            UUID mindmapId = UUID.fromString(mindmapIdStr);
            return mindmapRepository.findById(mindmapId);
        } catch (IllegalArgumentException e) {
            return Optional.empty();
        }
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
}
