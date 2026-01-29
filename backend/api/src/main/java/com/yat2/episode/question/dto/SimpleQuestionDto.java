package com.yat2.episode.question.dto;


import com.yat2.episode.question.Question;

public record SimpleQuestionDto(
        int id, String content
) {
    public static SimpleQuestionDto of(Question question) {
        return new SimpleQuestionDto(question.getId(), question.getContent());
    }
}
