package com.yat2.episode.question;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.util.ReflectionTestUtils;

import java.util.List;

import com.yat2.episode.competency.CompetencyType;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.job.Job;
import com.yat2.episode.question.dto.CategoryGroupResponseDto;
import com.yat2.episode.user.User;
import com.yat2.episode.user.UserService;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.mock;

@ExtendWith(MockitoExtension.class)
class QuestionServiceTest {

    @Mock
    private QuestionRepository questionRepository;

    @Mock
    private UserService userService;

    @InjectMocks
    private QuestionService questionService;

    @Test
    @DisplayName("사용자의 직무가 설정되지 않은 경우 JOB_NOT_SELECTED 예외가 발생한다")
    void getQuestionSet_Fail_JobNotSelected() {
        long userId = 12345678L;
        User userWithoutJob = User.newUser(userId, "테스트유저");

        given(userService.getUserOrThrow(userId)).willReturn(userWithoutJob);

        assertThatThrownBy(() -> questionService.getQuestionSetByUserId(userId)).isInstanceOf(CustomException.class)
                .hasFieldOrPropertyWithValue("errorCode", ErrorCode.JOB_NOT_SELECTED);
    }

    @Test
    @DisplayName("직무에 맞는 문항들을 조회하여 카테고리별로 그룹화하여 반환한다")
    void getQuestionSet_Success() {
        long userId = 12345678L;
        User user = User.newUser(userId, "테스트유저");

        Job job = new Job();
        ReflectionTestUtils.setField(job, "id", 10);
        user.updateJob(job);

        CompetencyType typeA = mock(CompetencyType.class);
        given(typeA.getCategory()).willReturn(CompetencyType.Category.협업_커뮤니케이션_역량);

        CompetencyType typeB = mock(CompetencyType.class);
        given(typeB.getCategory()).willReturn(CompetencyType.Category.문제해결_사고_역량);

        Question q1 = createQuestion(1, "질문1", typeA);
        Question q2 = createQuestion(2, "질문2", typeA);
        Question q3 = createQuestion(3, "질문3", typeB);

        given(userService.getUserOrThrow(userId)).willReturn(user);
        given(questionRepository.findAllWithCompetencyByJobId(10)).willReturn(List.of(q1, q2, q3));

        List<CategoryGroupResponseDto> result = questionService.getQuestionSetByUserId(userId);

        assertThat(result).hasSize(2);
        assertThat(result.get(0).category()).isEqualTo(CompetencyType.Category.협업_커뮤니케이션_역량);
        assertThat(result.get(0).questions()).hasSize(2);
    }

    private Question createQuestion(int id, String content, CompetencyType type) {
        Question q = new Question();
        ReflectionTestUtils.setField(q, "id", id);
        ReflectionTestUtils.setField(q, "content", content);
        ReflectionTestUtils.setField(q, "competencyType", type);
        return q;
    }
}
