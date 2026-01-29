package com.yat2.episode.question.dto;

import com.yat2.episode.competency.CompetencyType;

import java.util.List;

public record CategoryGroupResponseDto(
        CompetencyType.Category category,
        List<SimpleQuestionDto> questions) {
}
