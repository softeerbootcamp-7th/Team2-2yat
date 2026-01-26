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

@Service
@RequiredArgsConstructor
public class AuthService {

    private final KakaoOAuthClient kakaoOAuthClient;
    private final KakaoIdTokenVerifier kakaoIdTokenVerifier;
    private final UsersRepository usersRepository;
    private final JwtProvider jwtProvider;

    @Transactional
    public IssuedTokens handleKakaoCallback(
            HttpSession session,
            String code,
            String state
    ) {
        String sessionState = (String) session.getAttribute("OAUTH_STATE");

        if (sessionState == null || !sessionState.equals(state)) {
            throw new IllegalStateException("Invalid OAuth state");
        }

        session.removeAttribute("OAUTH_STATE");

        KakaoTokenResponse kakaoResponse = kakaoOAuthClient.requestToken(code);
        JWTClaimsSet claims =
                kakaoIdTokenVerifier.verify(kakaoResponse.idToken());

        Long kakaoUserId = Long.parseLong(claims.getSubject());
        String rawNickname = (String) claims.getClaim("nickname");
        if (rawNickname == null) {
            rawNickname = "USER_" + kakaoUserId;
        }

        final String nickname = rawNickname;
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
