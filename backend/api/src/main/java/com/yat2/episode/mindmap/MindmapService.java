package com.yat2.episode.mindmap;

import com.yat2.episode.mindmap.dto.MindmapDataDto;
import com.yat2.episode.users.Users;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class MindmapService {
    private final MindmapRepository mindmapRepository;
    private final MindmapParticipantRepository mindmapParticipantRepository;

    public MindmapService(MindmapRepository mindmapRepository, MindmapParticipantRepository mindmapParticipantRepository) {
        this.mindmapRepository = mindmapRepository;
        this.mindmapParticipantRepository = mindmapParticipantRepository;
    }

    public Optional<Mindmap> getMindmapById(String mindmapIdStr) {
        try {
            UUID mindmapId = UUID.fromString(mindmapIdStr);
            return mindmapRepository.findById(mindmapId);
        } catch (IllegalArgumentException e) {
            return Optional.empty();
        }
    }

    public List<MindmapDataDto> getPrivateMindmapById(Long userId) {
        return mindmapRepository.findMindmapsByUserId(userId)
                .stream()
                .filter(mindmap -> !mindmap.isShared())
                .map(MindmapDataDto::of)
                .toList();
    }

    public List<MindmapDataDto> getPublicMindmapById(Long userId) {
        return mindmapRepository.findMindmapsByUserId(userId)
                .stream()
                .filter(mindmap -> mindmap.isShared())
                .map(MindmapDataDto::of)
                .toList();
    }

}
