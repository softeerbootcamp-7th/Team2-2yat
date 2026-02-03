package com.yat2.episode.auth;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.yat2.episode.auth.cookie.AuthCookieFactory;
import com.yat2.episode.auth.jwt.IssuedTokens;
import com.yat2.episode.auth.oauth.KakaoProperties;
import com.yat2.episode.auth.oauth.OAuthUtil;
import com.yat2.episode.auth.refresh.RefreshTokenService;
import com.yat2.episode.auth.security.Public;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.global.swagger.ApiErrorCodes;

@Public
@RestController
@RequiredArgsConstructor
@RequestMapping("/auth")
@Tag(name = "Auth", description = "인증 관련")
public class AuthController {
    private static final String SESSION_STATE = "OAUTH_STATE";
    private final KakaoProperties kakaoProperties;
    private final AuthService authService;
    private final AuthCookieFactory authCookieFactory;
    private final RefreshTokenService refreshTokenService;
    @Value("${auth.redirect}")
    private String oauthRedirect;

    @GetMapping("/login")
    @Operation(summary = "카카오 로그인 시작", description = "카카오 OAuth 인가 페이지로 Redirect 합니다. state 값을 세션에 저장합니다.")
    @ApiResponses({ @ApiResponse(responseCode = "302", description = "카카오 인가 페이지로 Redirect") })
    @ApiErrorCodes(ErrorCode.INTERNAL_ERROR)
    public ResponseEntity<Void> loginWithKakao(HttpSession session) {
        try {
            String clientId = kakaoProperties.getClientId();
            String redirectUri = kakaoProperties.getRedirectUri();
            String authUrl = kakaoProperties.authUrl();

            String state = OAuthUtil.generateState();
            session.setAttribute(SESSION_STATE, state);

            String redirect = UriComponentsBuilder.fromUriString(authUrl).queryParam("response_type", "code")
                    .queryParam("client_id", clientId).queryParam("redirect_uri", redirectUri)
                    .queryParam("state", state).build().toUriString();

            return ResponseEntity.status(302).header(HttpHeaders.LOCATION, redirect).build();
        } catch (Exception e) {
            safeInvalidate(session);
            return redirectToFrontWithError(ErrorCode.INTERNAL_ERROR);
        }
    }

    @GetMapping("/callback")
    @Operation(summary = "카카오 OAuth 콜백",
            description = "카카오에서 전달된 code/state를 검증하고 토큰을 발급한 뒤, " + "access_token" + "/refresh_token 쿠키를 설정하고 프론트로 " +
                          "Redirect 합니다.")
    @ApiResponses({ @ApiResponse(responseCode = "302",
            description = "프론트 Redirect + Set-Cookie(access_token, " + "refresh_token)"), })
    @ApiErrorCodes({ ErrorCode.INVALID_OAUTH_STATE, ErrorCode.INVALID_OAUTH_ID_TOKEN, ErrorCode.INTERNAL_ERROR })
    public ResponseEntity<Void> kakaoCallback(HttpSession session, @RequestParam("code") String code,
                                              @RequestParam("state") String state) {
        try {
            String sessionState = (String) session.getAttribute(SESSION_STATE);
            if (sessionState == null || !sessionState.equals(state)) {
                throw new CustomException(ErrorCode.INVALID_OAUTH_STATE);
            }

            IssuedTokens tokens = authService.handleKakaoCallback(code);

            ResponseCookie accessCookie = authCookieFactory.access(tokens.accessToken());
            ResponseCookie refreshCookie = authCookieFactory.refresh(tokens.refreshToken());

            return ResponseEntity.status(302).header(HttpHeaders.LOCATION, oauthRedirect)
                    .header(HttpHeaders.SET_COOKIE, accessCookie.toString())
                    .header(HttpHeaders.SET_COOKIE, refreshCookie.toString()).build();

        } catch (CustomException e) {
            return redirectToFrontWithError(e.getErrorCode());
        } catch (Exception e) {
            return redirectToFrontWithError(ErrorCode.INTERNAL_ERROR);
        } finally {
            safeInvalidate(session);
        }
    }

    @PostMapping("/refresh")
    @Operation(summary = "토큰 재발급", description = "쿠키의 refresh_token을 검증한 뒤 새 토큰을 발급합니다.")
    @ApiResponses({ @ApiResponse(responseCode = "204", description = "재발급 성공 (응답 바디 없음, Set-Cookie로 토큰 갱신)") })
    @ApiErrorCodes({ ErrorCode.INVALID_TOKEN_TYPE, ErrorCode.INTERNAL_ERROR })
    public ResponseEntity<Void> refresh(
            @Parameter(in = ParameterIn.COOKIE, name = "refresh_token", description = "Refresh Token 쿠키",
                    required = true) @CookieValue(value = "refresh_token", required = false) String refreshToken) {
        IssuedTokens tokens = authService.refresh(refreshToken);

        ResponseCookie accessCookie = authCookieFactory.access(tokens.accessToken());
        ResponseCookie refreshCookie = authCookieFactory.refresh(tokens.refreshToken());

        return ResponseEntity.noContent().header(HttpHeaders.SET_COOKIE, accessCookie.toString())
                .header(HttpHeaders.SET_COOKIE, refreshCookie.toString()).build();
    }

    @PostMapping("/logout")
    @Operation(summary = "로그아웃", description = "쿠키의 refresh_token을 기반으로 access_token/refresh_token을 만료 처리합니다")
    @ApiResponses({ @ApiResponse(responseCode = "204", description = "로그아웃 성공 (응답 바디 없음, Set-Cookie로 쿠키 만료)") })
    @ApiErrorCodes(ErrorCode.INTERNAL_ERROR)
    public ResponseEntity<Void> logout(@Parameter(in = ParameterIn.COOKIE, name = "refresh_token",
            description = "Refresh Token 쿠키 (없어도 로그아웃 처리됨)") @CookieValue(value = "refresh_token",
            required = false) String refreshToken) {
        refreshTokenService.deleteByRefreshToken(refreshToken);

        ResponseCookie expiredAccess = authCookieFactory.deleteAccess();
        ResponseCookie expiredRefresh = authCookieFactory.deleteRefresh();

        return ResponseEntity.noContent().header(HttpHeaders.SET_COOKIE, expiredAccess.toString())
                .header(HttpHeaders.SET_COOKIE, expiredRefresh.toString()).build();
    }

    private ResponseEntity<Void> redirectToFrontWithError(ErrorCode errorCode) {
        String redirect =
                UriComponentsBuilder.fromUriString(oauthRedirect).queryParam("error_code", errorCode.getCode()).build()
                        .toUriString();

        return ResponseEntity.status(302).header(HttpHeaders.LOCATION, redirect).build();
    }

    private void safeInvalidate(HttpSession session) {
        try {
            session.invalidate();
        } catch (Exception ignored) {}
    }
}
