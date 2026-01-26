package com.yat2.episode.competency.dto;

import com.yat2.episode.competency.CompetencyType;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class DetailCompetencyTypeDto {
    private int id;
    private String competencyType;


    public static DetailCompetencyTypeDto of(CompetencyType competencyType) {
        return DetailCompetencyTypeDto.builder()
                .id(competencyType.getId())
                .competencyType(competencyType.getTypeName())
                .build();
    }
}
