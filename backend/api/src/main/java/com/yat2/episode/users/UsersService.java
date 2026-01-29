package com.yat2.episode.users;

import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.users.dto.UserMeResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UsersService {

    private final UsersRepository usersRepository;

    public List<Users> getAllUsers() {
        return usersRepository.findAll();
    }

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
}
