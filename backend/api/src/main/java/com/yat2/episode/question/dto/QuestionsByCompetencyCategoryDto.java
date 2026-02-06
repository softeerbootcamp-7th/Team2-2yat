package com.yat2.episode.question.dto;

import java.util.List;

import com.yat2.episode.competency.CompetencyType;

public record QuestionsByCompetencyCategoryDto(
        CompetencyType.Category category,
        List<QuestionSummaryDto> questions
) {}
