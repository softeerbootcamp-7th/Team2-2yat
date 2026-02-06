package com.yat2.episode.question.dto;


import com.yat2.episode.question.Question;

public record QuestionSummaryDto(
        int id,
        String content
) {
    public static QuestionSummaryDto of(Question question) {
        return new QuestionSummaryDto(question.getId(), question.getContent());
    }
}
