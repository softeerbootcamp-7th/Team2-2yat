package com.yat2.episode.mindmap.dto;

import java.time.LocalDateTime;
import java.util.UUID;

import com.yat2.episode.mindmap.MindmapParticipant;

public record MindmapDataDto(
        UUID mindmapId,
        String mindmapName,
        LocalDateTime createdAt,
        LocalDateTime updatedAt,
        boolean isFavorite
) {
    public static MindmapDataDto of(MindmapParticipant mindmapParticipant) {
        return new MindmapDataDto(mindmapParticipant.getMindmap().getId(), mindmapParticipant.getMindmap().getName(),
                                  mindmapParticipant.getMindmap().getCreatedAt(),
                                  mindmapParticipant.getMindmap().getUpdatedAt(), mindmapParticipant.isFavorite());
    }
}
