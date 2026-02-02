package com.yat2.episode.mindmap.dto;

import com.yat2.episode.mindmap.Mindmap;

import java.time.LocalDateTime;
import java.util.UUID;

public record MindmapDataExceptDateDto (
        UUID mindmapId,
        String mindmapName,
        boolean isFavorite
){
    public static MindmapDataExceptDateDto of(Mindmap mindmap) {
        return new MindmapDataExceptDateDto(
                mindmap.getId(),
                mindmap.getName(),
                mindmap.isFavorite()
        );
    }
}