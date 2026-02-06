package com.yat2.episode.api.question.dto;


import com.yat2.episode.api.question.Question;

public record QuestionSummaryDto(
        int id,
        String content
) {
    public static QuestionSummaryDto of(Question question) {
        return new QuestionSummaryDto(question.getId(), question.getContent());
    }
}
