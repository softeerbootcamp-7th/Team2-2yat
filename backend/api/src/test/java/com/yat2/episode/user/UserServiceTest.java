package com.yat2.episode.user;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.util.ReflectionTestUtils;

import java.util.Optional;

import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.job.Job;
import com.yat2.episode.job.JobRepository;
import com.yat2.episode.user.dto.UserMeDto;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;

@ExtendWith(MockitoExtension.class)
@DisplayName("UserService 단위 테스트")
class UserServiceTest {

    @Mock
    private UserRepository userRepository;

    @Mock
    private JobRepository jobRepository;

    @InjectMocks
    private UserService userService;

    private final long testUserId = 12345678L;
    private User testUser;

    @BeforeEach
    void setUp() {
        testUser = User.newUser(testUserId, "테스트유저");
    }

    @Nested
    @DisplayName("getOrCreateKakaoUser")
    class GetOrCreateKakaoUserTest {

        @Test
        @DisplayName("이미 존재하는 카카오 유저라면 기존 유저를 반환한다")
        void should_return_existing_user_when_user_exists() {
            given(userRepository.findById(testUserId)).willReturn(Optional.of(testUser));

            User result = userService.getOrCreateKakaoUser(testUserId, "테스트유저");

            assertThat(result).isEqualTo(testUser);
            verify(userRepository, never()).save(any(User.class));
        }

        @Test
        @DisplayName("존재하지 않는 카카오 유저라면 새로 생성하여 저장 후 반환한다")
        void should_create_and_save_new_user_when_user_not_exists() {
            given(userRepository.findById(testUserId)).willReturn(Optional.empty());
            given(userRepository.save(any(User.class))).willReturn(testUser);

            User result = userService.getOrCreateKakaoUser(testUserId, "테스트유저");

            assertThat(result).isEqualTo(testUser);
            verify(userRepository).save(any(User.class));
        }
    }

    @Nested
    @DisplayName("getMe")
    class GetMeTest {

        @Test
        @DisplayName("유저 정보를 조회하여 UserMeDto로 변환한다 (onboarded false 케이스)")
        void should_return_user_me_dto_with_onboarded_false() {
            given(userRepository.findById(testUserId)).willReturn(Optional.of(testUser));

            UserMeDto result = userService.getMe(testUserId);

            assertThat(result.userId()).isEqualTo(testUserId);
            assertThat(result.onboarded()).isFalse();
            assertThat(result.guideSeen()).isFalse();
        }

        @Test
        @DisplayName("직무가 설정된 유저의 경우 onboarded는 true여야 한다")
        void should_return_user_me_dto_with_onboarded_true() {
            Job job = mock(Job.class);
            testUser.updateJob(job);
            given(userRepository.findById(testUserId)).willReturn(Optional.of(testUser));

            UserMeDto result = userService.getMe(testUserId);

            assertThat(result.onboarded()).isTrue();
        }
    }

    @Nested
    @DisplayName("updateJob")
    class UpdateJobTest {

        @Test
        @DisplayName("유저의 직무를 성공적으로 업데이트한다")
        void should_update_job_successfully() {
            int jobId = 1;
            Job job = new Job();
            ReflectionTestUtils.setField(job, "id", jobId);

            given(userRepository.findById(testUserId)).willReturn(Optional.of(testUser));
            given(jobRepository.findById(jobId)).willReturn(Optional.of(job));

            userService.updateJob(testUserId, jobId);

            assertThat(testUser.getJob()).isEqualTo(job);
            verify(userRepository).findById(testUserId);
        }

        @Test
        @DisplayName("존재하지 않는 직무 ID일 경우 JOB_NOT_FOUND 예외를 던진다")
        void should_throw_exception_when_job_not_found() {
            int invalidJobId = 999;
            given(userRepository.findById(testUserId)).willReturn(Optional.of(testUser));
            given(jobRepository.findById(invalidJobId)).willReturn(Optional.empty());

            assertThatThrownBy(() -> userService.updateJob(testUserId, invalidJobId)).isInstanceOf(
                            CustomException.class).extracting(e -> ((CustomException) e).getErrorCode())
                    .isEqualTo(ErrorCode.JOB_NOT_FOUND);
        }
    }

    @Nested
    @DisplayName("markFeatureGuideWatched")
    class MarkFeatureGuideWatchedTest {

        @Test
        @DisplayName("가이드 시청 여부 상태를 true로 변경한다")
        void should_update_guide_watched_status() {
            given(userRepository.findById(testUserId)).willReturn(Optional.of(testUser));

            userService.markFeatureGuideWatched(testUserId);

            assertThat(testUser.getHasWatchedFeatureGuide()).isTrue();
        }
    }
}