package com.yat2.episode.competency.dto;

import lombok.Builder;
import lombok.Getter;

import com.yat2.episode.competency.CompetencyType;

@Getter
@Builder
public class DetailCompetencyTypeDto {
    private int id;
    private String competencyType;


    public static DetailCompetencyTypeDto of(CompetencyType competencyType) {
        return DetailCompetencyTypeDto.builder().id(competencyType.getId()).competencyType(competencyType.getTypeName())
                .build();
    }
}
