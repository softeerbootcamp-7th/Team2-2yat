package com.yat2.episode.competency.dto;

import com.yat2.episode.competency.CompetencyType;

public record DetailCompetencyTypeDto(
        int id,
        CompetencyType.Category category,
        String competencyType
) {
    public static DetailCompetencyTypeDto of(CompetencyType competencyType) {
        return new DetailCompetencyTypeDto(competencyType.getId(), competencyType.getCategory(),
                                           competencyType.getTypeName());
    }
}
