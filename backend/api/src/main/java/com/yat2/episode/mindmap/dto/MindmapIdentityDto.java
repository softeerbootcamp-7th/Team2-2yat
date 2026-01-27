package com.yat2.episode.mindmap.dto;

import java.util.UUID;

public record MindmapIdentityDto (
    UUID mindmapId,
    String mindmapName)
{}
