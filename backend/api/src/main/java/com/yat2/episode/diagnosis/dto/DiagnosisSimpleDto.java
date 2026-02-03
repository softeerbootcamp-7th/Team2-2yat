package com.yat2.episode.diagnosis.dto;

import java.time.LocalDateTime;

import com.yat2.episode.diagnosis.DiagnosisResult;

public record DiagnosisSimpleDto(Integer diagnosisId, String diagnosisName, LocalDateTime createdAt,
                                 int lackCountOfCompetency) {
    private static final String DIAGNOSIS_TEMPLATE = " 직무 진단 결과";

    public static DiagnosisSimpleDto of(DiagnosisResult diagnosisResult, int lackCountOfCompetency) {
        return new DiagnosisSimpleDto(diagnosisResult.getId(), diagnosisResult.getJob().getName() + DIAGNOSIS_TEMPLATE,
                                      diagnosisResult.getCreatedAt(), lackCountOfCompetency);
    }
}
