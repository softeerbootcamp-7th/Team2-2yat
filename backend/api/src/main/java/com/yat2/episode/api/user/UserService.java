package com.yat2.episode.api.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yat2.episode.api.global.exception.CustomException;
import com.yat2.episode.api.global.exception.ErrorCode;
import com.yat2.episode.api.job.Job;
import com.yat2.episode.api.job.JobRepository;
import com.yat2.episode.api.user.dto.UserMeDto;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final JobRepository jobRepository;

    @Transactional(readOnly = true)
    public User getUserOrThrow(long userId) {
        return userRepository.findById(userId).orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));
    }

    @Transactional
    public User getOrCreateKakaoUser(long kakaoId, String nickname) {
        return userRepository.findById(kakaoId).orElseGet(() -> userRepository.save(User.newUser(kakaoId, nickname)));
    }

    @Transactional(readOnly = true)
    public UserMeDto getMe(long userId) {
        User user = getUserOrThrow(userId);

        boolean onboarded = user.getJob() != null;

        return new UserMeDto(user.getKakaoId(), user.getNickname(), onboarded, user.getHasWatchedFeatureGuide());
    }

    @Transactional
    public void updateJob(long userId, int jobId) {
        User user = getUserOrThrow(userId);

        Job job = jobRepository.findById(jobId).orElseThrow(() -> new CustomException(ErrorCode.JOB_NOT_FOUND));

        user.updateJob(job);
    }

    @Transactional
    public void markFeatureGuideWatched(long userId) {
        User user = getUserOrThrow(userId);
        user.markFeatureGuideWatched();
    }

}
