package com.yat2.episode.api.question.dto;

import com.yat2.episode.api.competency.dto.CompetencyTypeDto;
import com.yat2.episode.api.question.Question;

public record QuestionDetailDto(
        int questionId,
        CompetencyTypeDto competency,
        String question,
        String guidanceMessage
) {
    public static QuestionDetailDto of(Question question) {
        return new QuestionDetailDto(question.getId(), CompetencyTypeDto.of(question.getCompetencyType()),
                                     question.getContent(), question.getGuidanceMessage());
    }
}
