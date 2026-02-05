package com.yat2.episode.diagnosis;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

import com.yat2.episode.diagnosis.dto.DiagnosisSummaryDto;

@Repository
public interface DiagnosisResultRepository extends JpaRepository<DiagnosisResult, Integer> {
    @Query(
            """
                    SELECT NEW com.yat2.episode.diagnosis.dto.DiagnosisSummaryDto(
                        d.id,
                        d.job.name,
                        d.createdAt,
                        COUNT(w.id)
                    )
                    FROM DiagnosisResult d
                    LEFT JOIN DiagnosisWeakness w ON w.diagnosisResult = d
                    WHERE d.user.kakaoId = :userId
                    GROUP BY d.id, d.job.name, d.createdAt
                    ORDER BY d.createdAt DESC
                    """
    )
    List<DiagnosisSummaryDto> findDiagnosisSummariesByUserId(
            @Param("userId") Long userId
    );
}
