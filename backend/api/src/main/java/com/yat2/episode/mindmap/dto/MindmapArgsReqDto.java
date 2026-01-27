package com.yat2.episode.mindmap.dto;

import java.util.List;

public record MindmapArgsReqDto(
        boolean isShared,
        List<String> activityCases
) {
}
