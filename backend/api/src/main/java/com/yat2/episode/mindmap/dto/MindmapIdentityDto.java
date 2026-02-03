package com.yat2.episode.mindmap.dto;

import java.util.UUID;

import com.yat2.episode.mindmap.Mindmap;

public record MindmapIdentityDto(UUID mindmapId, String mindmapName) {
    public static MindmapIdentityDto of(Mindmap mindmap) {
        return new MindmapIdentityDto(mindmap.getId(), mindmap.getName());
    }
}
