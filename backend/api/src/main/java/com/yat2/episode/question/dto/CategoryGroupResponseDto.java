package com.yat2.episode.question.dto;

import java.util.List;

import com.yat2.episode.competency.CompetencyType;

public record CategoryGroupResponseDto(CompetencyType.Category category, List<SimpleQuestionDto> questions) {}
