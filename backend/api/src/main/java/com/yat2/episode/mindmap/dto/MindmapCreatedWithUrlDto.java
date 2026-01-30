package com.yat2.episode.mindmap.dto;

public record MindmapCreatedWithUrlDto(
        MindmapDataExceptDateDto mindmap,
        String presignedUrl
) {}
