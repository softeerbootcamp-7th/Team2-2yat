package com.yat2.episode.mindmap.dto;

import com.yat2.episode.mindmap.MindmapParticipant;

import java.util.UUID;

public record MindmapDataExceptDateDto (
        UUID mindmapId,
        String mindmapName,
        boolean isFavorite
){
    public static MindmapDataExceptDateDto of(MindmapParticipant mindmapParticipant) {
        return new MindmapDataExceptDateDto(
                mindmapParticipant.getMindmap().getId(),
                mindmapParticipant.getMindmap().getName(),
                mindmapParticipant.isFavorite()
        );
    }
}