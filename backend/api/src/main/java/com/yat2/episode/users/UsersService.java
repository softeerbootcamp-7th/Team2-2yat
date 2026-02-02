package com.yat2.episode.users;

import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.job.Job;
import com.yat2.episode.job.JobRepository;
import com.yat2.episode.users.dto.UserMeResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UsersService {

    private final UsersRepository usersRepository;
    private final JobRepository jobRepository;

    @Transactional(readOnly = true)
    public UserMeResponse getMe(long userId) {
        Users user = usersRepository.findById(userId)
                .orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));

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
        Users user = usersRepository.findById(userId)
                .orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));

        Job job = jobRepository.findById(jobId)
                .orElseThrow(() -> new CustomException(ErrorCode.JOB_NOT_FOUND));

        user.updateJob(job);
    }

    @Transactional
    public void markFeatureGuideWatched(long userId) {
        Users user = usersRepository.findById(userId)
                .orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));

        user.markFeatureGuideWatched();
    }
}
