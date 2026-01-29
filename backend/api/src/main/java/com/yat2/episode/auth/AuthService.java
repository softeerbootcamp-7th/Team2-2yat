package com.yat2.episode.auth;

import com.nimbusds.jwt.JWTClaimsSet;
import com.yat2.episode.auth.dto.IssuedTokens;
import com.yat2.episode.auth.dto.KakaoTokenResponse;
import com.yat2.episode.auth.refresh.RefreshTokenService;
import com.yat2.episode.auth.token.JwtProvider;
import com.yat2.episode.auth.oauth.KakaoIdTokenVerifier;
import com.yat2.episode.auth.oauth.KakaoOAuthClient;
import com.yat2.episode.users.Users;
import com.yat2.episode.users.UsersRepository;
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
    private final RefreshTokenService refreshTokenService;

    @Transactional
    public IssuedTokens handleKakaoCallback(String code) {
        KakaoTokenResponse kakaoResponse = kakaoOAuthClient.requestToken(code);
        JWTClaimsSet claims = kakaoIdTokenVerifier.verify(kakaoResponse.idToken());

        Long kakaoUserId = Long.parseLong(claims.getSubject());

        String nickname = Optional.ofNullable((String) claims.getClaim("nickname"))
                .orElse("USER_" + kakaoUserId);

        Users user = usersRepository.findByKakaoId(kakaoUserId)
                .orElseGet(() -> usersRepository.save(Users.newUser(kakaoUserId, nickname)));

        if (!nickname.equals(user.getNickname())) {
            user.changeNickname(nickname);
        }

        IssuedTokens tokens =  jwtProvider.issueTokens(kakaoUserId);
        refreshTokenService.save(kakaoUserId, tokens.refreshToken());

        return tokens;
    }

    public Long getUserIdByToken(String token){
        return jwtProvider.verifyAccessTokenAndGetUserId(token);
    }
  
    @Transactional
    public IssuedTokens refresh(String refreshToken) {
        Long userId = jwtProvider.verifyRefreshTokenAndGetUserId(refreshToken);
        refreshTokenService.validateSession(refreshToken);

        IssuedTokens tokens = jwtProvider.issueTokens(userId);
        refreshTokenService.save(userId, tokens.refreshToken());

        return tokens;
    }
}
