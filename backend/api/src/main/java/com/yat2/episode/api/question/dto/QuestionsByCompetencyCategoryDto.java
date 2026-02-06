package com.yat2.episode.api.question.dto;

import java.util.List;

import com.yat2.episode.api.competency.CompetencyType;

public record QuestionsByCompetencyCategoryDto(
        CompetencyType.Category category,
        List<QuestionSummaryDto> questions
) {}
