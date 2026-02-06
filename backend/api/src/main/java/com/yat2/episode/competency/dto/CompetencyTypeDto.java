package com.yat2.episode.competency.dto;

import com.yat2.episode.competency.CompetencyType;

public record CompetencyTypeDto(
        CompetencyType.Category category,
        String competencyType
) {
    public static CompetencyTypeDto of(CompetencyType competencyType) {
        return new CompetencyTypeDto(competencyType.getCategory(), competencyType.getTypeName());
    }
}
