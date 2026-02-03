package com.yat2.episode.diagnosis.dto;

import com.yat2.episode.diagnosis.DiagnosisResult;

public record DiagnosisSimpleNoDateDto(Integer diagnosisId, String diagnosisName, int lackCountOfCompetency) {
    static final String diagnosisTemplate = " 직무 진단 결과";

    static public DiagnosisSimpleNoDateDto of(DiagnosisResult diagnosisResult, int lackCountOfCompetency) {
        return new DiagnosisSimpleNoDateDto(diagnosisResult.getId(),
                                            diagnosisResult.getJob().getName() + diagnosisTemplate,
                                            lackCountOfCompetency);
    }
}
