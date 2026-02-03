package com.yat2.episode.diagnosis.dto;

import com.yat2.episode.diagnosis.DiagnosisResult;

public record DiagnosisSimpleNoDateDto(Integer diagnosisId, String diagnosisName, int lackCountOfCompetency) {
    private static final String DIAGNOSIS_TEMPLATE = " 직무 진단 결과";

    public static DiagnosisSimpleNoDateDto of(DiagnosisResult diagnosisResult, int lackCountOfCompetency) {
        return new DiagnosisSimpleNoDateDto(diagnosisResult.getId(),
                                            diagnosisResult.getJob().getName() + DIAGNOSIS_TEMPLATE,
                                            lackCountOfCompetency);
    }
}
