package com.yat2.episode.diagnosis.dto;

import java.time.LocalDateTime;

import com.yat2.episode.diagnosis.DiagnosisResult;

public record DiagnosisSimpleDto(Integer diagnosisId, String diagnosisName, LocalDateTime createdAt,
                                 int lackCountOfCompetency) {

    public static DiagnosisSimpleDto of(DiagnosisResult diagnosisResult, int lackCountOfCompetency) {
        return new DiagnosisSimpleDto(diagnosisResult.getId(), diagnosisResult.getJob().getName(),
                                      diagnosisResult.getCreatedAt(), lackCountOfCompetency);
    }
}
