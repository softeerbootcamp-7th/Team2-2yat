package com.yat2.episode.question;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;
import org.springframework.test.util.ReflectionTestUtils;

import java.util.List;

import com.yat2.episode.competency.CompetencyType;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.job.Job;
import com.yat2.episode.question.dto.QuestionsByCompetencyCategoryDto;
import com.yat2.episode.user.User;
import com.yat2.episode.user.UserService;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.anyInt;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
@DisplayName("QuestionService 단위 테스트")
class QuestionServiceTest {

    @Mock
    private QuestionRepository questionRepository;

    @Mock
    private UserService userService;

    @InjectMocks
    private QuestionService questionService;

    private User testUser;
    private final long testUserId = 12345678L;

    @BeforeEach
    void setUp() {
        testUser = User.newUser(testUserId, "테스트유저");
    }

    @Nested
    @DisplayName("getQuestionSetByUserId")
    class GetQuestionSetByUserIdTest {

        @Test
        @DisplayName("사용자의 직무가 설정되지 않은 경우 JOB_NOT_SELECTED 예외가 발생한다")
        void should_throw_exception_when_job_is_not_selected() {
            given(userService.getUserOrThrow(testUserId)).willReturn(testUser);

            assertThatThrownBy(() -> questionService.getQuestionSetByUserId(testUserId)).isInstanceOf(
                            CustomException.class).extracting(e -> ((CustomException) e).getErrorCode())
                    .isEqualTo(ErrorCode.JOB_NOT_SELECTED);

            verify(questionRepository, never()).findAllWithCompetencyByJobId(anyInt());
        }

        @Test
        @DisplayName("직무가 설정된 사용자의 문항들을 카테고리별로 그룹화하여 반환한다")
        void should_return_questions_grouped_by_category() {
            Job testJob = new Job();
            ReflectionTestUtils.setField(testJob, "id", 7);
            testUser.updateJob(testJob);

            CompetencyType coreComp = mock(CompetencyType.class);
            when(coreComp.getCategory()).thenReturn(CompetencyType.Category.협업_커뮤니케이션_역량);

            CompetencyType jobComp = mock(CompetencyType.class);
            when(jobComp.getCategory()).thenReturn(CompetencyType.Category.문제해결_사고_역량);

            Question q1 = createQuestion(1, "동료와 어떻게 소통하나요?", coreComp);
            Question q2 = createQuestion(2, "기술적 난관을 어떻게 해결하나요?", jobComp);

            given(userService.getUserOrThrow(testUserId)).willReturn(testUser);
            given(questionRepository.findAllWithCompetencyByJobId(7)).willReturn(List.of(q1, q2));

            List<QuestionsByCompetencyCategoryDto> result = questionService.getQuestionSetByUserId(testUserId);

            assertThat(result).hasSize(2);

            assertThat(result.get(0).category()).isEqualTo(CompetencyType.Category.협업_커뮤니케이션_역량);
            assertThat(result.get(0).questions().get(0).content()).isEqualTo("동료와 어떻게 소통하나요?");

            assertThat(result.get(1).category()).isEqualTo(CompetencyType.Category.문제해결_사고_역량);
            assertThat(result.get(1).questions().get(0).content()).isEqualTo("기술적 난관을 어떻게 해결하나요?");

            verify(userService).getUserOrThrow(testUserId);
            verify(questionRepository).findAllWithCompetencyByJobId(7);
        }
    }

    private Question createQuestion(int id, String content, CompetencyType type) {
        Question q = new Question();
        ReflectionTestUtils.setField(q, "id", id);
        ReflectionTestUtils.setField(q, "content", content);
        ReflectionTestUtils.setField(q, "competencyType", type);
        return q;
    }
}