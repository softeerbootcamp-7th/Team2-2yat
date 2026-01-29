package com.yat2.episode.mindmap.dto;

import com.yat2.episode.mindmap.Mindmap;

import java.util.UUID;

public record MindmapIdentityDto (
    UUID mindmapId,
    String mindmapName)
{
    public static MindmapIdentityDto of(Mindmap mindmap) {
        return new MindmapIdentityDto(
                mindmap.getId(),
                mindmap.getName()
        );
    }
}
