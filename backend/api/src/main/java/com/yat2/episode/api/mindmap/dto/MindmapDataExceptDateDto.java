package com.yat2.episode.api.mindmap.dto;

import java.util.UUID;

import com.yat2.episode.api.mindmap.MindmapParticipant;

public record MindmapDataExceptDateDto(
        UUID mindmapId,
        String mindmapName,
        boolean isFavorite
) {
    public static MindmapDataExceptDateDto of(MindmapParticipant mindmapParticipant) {
        return new MindmapDataExceptDateDto(mindmapParticipant.getMindmap().getId(),
                                            mindmapParticipant.getMindmap().getName(), mindmapParticipant.isFavorite());
    }
}
