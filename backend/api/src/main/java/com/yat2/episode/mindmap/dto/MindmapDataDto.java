package com.yat2.episode.mindmap.dto;

import java.sql.Date;
import java.util.UUID;

public record MindmapDataDto (
    UUID mindmapId,
    String mindmapName,
    Date createAt,
    Date updateAt,
    boolean isFavorite
){}
