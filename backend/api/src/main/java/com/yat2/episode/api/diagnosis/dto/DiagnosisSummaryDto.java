package com.yat2.episode.api.diagnosis.dto;

import java.time.LocalDateTime;

import com.yat2.episode.api.diagnosis.DiagnosisResult;

public record DiagnosisSummaryDto(
        int diagnosisId,
        String jobName,
        LocalDateTime createdAt,
        int weaknessCount
) {
    public DiagnosisSummaryDto(int diagnosisId, String jobName, LocalDateTime createdAt, Long weaknessCount) {
        this(diagnosisId, jobName, createdAt, weaknessCount.intValue());
    }

    public static DiagnosisSummaryDto of(DiagnosisResult diagnosisResult, int weaknessCount) {
        return new DiagnosisSummaryDto(diagnosisResult.getId(), diagnosisResult.getJob().getName(),
                                       diagnosisResult.getCreatedAt(), weaknessCount);
    }
}
