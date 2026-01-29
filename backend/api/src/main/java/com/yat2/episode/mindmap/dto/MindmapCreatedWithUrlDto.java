package com.yat2.episode.mindmap.dto;

public record MindmapCreatedWithUrlDto(
        MindmapDataDto mindmap,
        String presignedUrl
) {}
