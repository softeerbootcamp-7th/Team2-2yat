package com.yat2.episode.user;

import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.job.Job;
import com.yat2.episode.job.JobRepository;
import com.yat2.episode.user.dto.UserMeResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final JobRepository jobRepository;

    @Transactional(readOnly = true)
    public User getUserOrThrow(long userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));
    }

    @Transactional(readOnly = true)
    public UserMeResponse getMe(long userId) {
        User user = getUserOrThrow(userId);

        boolean onboarded = user.getJob() != null;

        return new UserMeResponse(
                user.getKakaoId(),
                user.getNickname(),
                onboarded,
                user.getHasWatchedFeatureGuide()
        );
    }

    @Transactional
    public void updateJob(long userId, int jobId) {
        User user = getUserOrThrow(userId);

        Job job = jobRepository.findById(jobId)
                .orElseThrow(() -> new CustomException(ErrorCode.JOB_NOT_FOUND));

        user.updateJob(job);
    }

    @Transactional
    public void markFeatureGuideWatched(long userId) {
        User user = getUserOrThrow(userId);
        user.markFeatureGuideWatched();
    }

}
