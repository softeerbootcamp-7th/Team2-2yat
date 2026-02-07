package com.yat2.episode.diagnosis;

import com.yat2.episode.diagnosis.dto.DiagnosisSummaryDto;
import com.yat2.episode.job.Job;
import com.yat2.episode.question.Question;
import com.yat2.episode.user.User;
import com.yat2.episode.user.UserRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import static com.yat2.episode.utils.TestEntityFactory.createEntity;
import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Transactional
@ActiveProfiles("local")
@DisplayName("DiagnosisRepository 통합 테스트")
class DiagnosisRepositoryTest {

    @Autowired
    private DiagnosisRepository diagnosisRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private DiagnosisWeaknessRepository weaknessRepository;

    @Test
    @DisplayName("사용자 ID로 진단 요약 목록을 DTO로 조회한다")
    void findDiagnosisSummariesByUserId_Success() {
        long kakaoId = 123456789L;
        User user = createEntity(User.class);
        ReflectionTestUtils.setField(user, "kakaoId", kakaoId);
        ReflectionTestUtils.setField(user, "nickname", "테스트유저");
        ReflectionTestUtils.setField(user, "hasWatchedFeatureGuide", false);
        userRepository.save(user);

        Job fakeJob = createEntity(Job.class);
        ReflectionTestUtils.setField(fakeJob, "id", 1);
        ReflectionTestUtils.setField(fakeJob, "name", "백엔드");

        DiagnosisResult dr = createEntity(DiagnosisResult.class);
        ReflectionTestUtils.setField(dr, "user", user);
        ReflectionTestUtils.setField(dr, "job", fakeJob);
        ReflectionTestUtils.setField(dr, "createdAt", LocalDateTime.now());
        diagnosisRepository.save(dr);

        for (int i = 1; i <= 2; i++) {
            DiagnosisWeakness weakness = createEntity(DiagnosisWeakness.class);
            ReflectionTestUtils.setField(weakness, "diagnosisResult", dr);

            Question fakeQuestion = createEntity(Question.class);
            ReflectionTestUtils.setField(fakeQuestion, "id", i);
            ReflectionTestUtils.setField(weakness, "question", fakeQuestion);

            weaknessRepository.save(weakness);
        }

        List<DiagnosisSummaryDto> summaries = diagnosisRepository.findDiagnosisSummariesByUserId(kakaoId);

        assertThat(summaries).isNotEmpty();
        assertThat(summaries.get(0).weaknessCount()).isEqualTo(2);
    }

    @Test
    @DisplayName("진단 ID와 사용자 ID로 상세 정보를 모든 연관 엔티티와 함께 페치 조인 조회한다")
    void findDetailByIdAndUserId_Success() {
        long kakaoId = 987654321L;
        User user = createEntity(User.class);
        ReflectionTestUtils.setField(user, "kakaoId", kakaoId);
        ReflectionTestUtils.setField(user, "nickname", "상세유저");
        ReflectionTestUtils.setField(user, "hasWatchedFeatureGuide", true);
        userRepository.save(user);

        Job fakeJob = createEntity(Job.class);
        ReflectionTestUtils.setField(fakeJob, "id", 1);

        DiagnosisResult dr = createEntity(DiagnosisResult.class);
        ReflectionTestUtils.setField(dr, "user", user);
        ReflectionTestUtils.setField(dr, "job", fakeJob);
        diagnosisRepository.save(dr);

        Optional<DiagnosisResult> result = diagnosisRepository.findDetailByIdAndUserId(dr.getId(), kakaoId);

        assertThat(result).isPresent();
        DiagnosisResult found = result.get();
        assertThat(found.getUser().getKakaoId()).isEqualTo(kakaoId);
        assertThat(found.getJob().getId()).isEqualTo(1);
    }
}