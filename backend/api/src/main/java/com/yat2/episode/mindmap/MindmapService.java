package com.yat2.episode.mindmap;

import java.util.Optional;
import java.util.UUID;

public class MindmapService {
    private final MindmapRepository mindmapRepository;

    public MindmapService(MindmapRepository mindmapRepository) {
        this.mindmapRepository = mindmapRepository;
    }

    public Optional<Mindmap> getMindmapById(String mindmapIdStr) {
        try {
            UUID mindmapId = UUID.fromString(mindmapIdStr);
            return mindmapRepository.findById(mindmapId);
        } catch (IllegalArgumentException e) {
            return Optional.empty();
        }
    }
}
