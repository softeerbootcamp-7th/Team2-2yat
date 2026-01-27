package com.yat2.episode.auth;

import com.nimbusds.jwt.JWTClaimsSet;
import com.yat2.episode.auth.dto.IssuedTokens;
import com.yat2.episode.auth.dto.KakaoTokenResponse;
import com.yat2.episode.auth.token.JwtProvider;
import com.yat2.episode.auth.oauth.KakaoIdTokenVerifier;
import com.yat2.episode.auth.oauth.KakaoOAuthClient;
import com.yat2.episode.users.Users;
import com.yat2.episode.users.UsersRepository;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final KakaoOAuthClient kakaoOAuthClient;
    private final KakaoIdTokenVerifier kakaoIdTokenVerifier;
    private final UsersRepository usersRepository;
    private final JwtProvider jwtProvider;

    @Transactional
    public IssuedTokens handleKakaoCallback(String code) {
        KakaoTokenResponse kakaoResponse = kakaoOAuthClient.requestToken(code);
        JWTClaimsSet claims = kakaoIdTokenVerifier.verify(kakaoResponse.idToken());

        Long kakaoUserId = Long.parseLong(claims.getSubject());

        String nickname = Optional.ofNullable((String) claims.getClaim("nickname"))
                .orElse("USER_" + kakaoUserId);

        Users user = usersRepository.findByKakaoId(kakaoUserId)
                .orElseGet(() -> createNewUser(kakaoUserId, nickname));

        return jwtProvider.issueTokens(user.getKakaoId());
    }

    private Users createNewUser(Long kakaoUserId, String nickname) {
        Users user = new Users();
        user.setKakaoId(kakaoUserId);

        user.setNickname(nickname);
        user.setHasWatchedFeatureGuide(false);

        return usersRepository.save(user);
    }
}
