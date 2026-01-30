package com.yat2.episode.auth;

import com.yat2.episode.auth.oauth.OAuthRedirectProperties;
import com.yat2.episode.auth.jwt.IssuedTokens;
import com.yat2.episode.auth.oauth.KakaoProperties;
import com.yat2.episode.auth.oauth.OAuthUtil;
import com.yat2.episode.auth.refresh.RefreshTokenService;
import com.yat2.episode.auth.cookie.AuthCookieFactory;
import com.yat2.episode.auth.security.Public;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.global.exception.ErrorResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

@Public
@RestController
@RequiredArgsConstructor
@RequestMapping("/auth")
@Tag(name = "Auth", description = "인증 관련")
public class AuthController {
    private static final String SESSION_STATE = "OAUTH_STATE";
    private static final String SESSION_LOCAL_DEV = "OAUTH_LOCAL_DEV";

    private final KakaoProperties kakaoProperties;
    private final AuthService authService;
    private final AuthCookieFactory authCookieFactory;
    private final OAuthRedirectProperties oAuthRedirectProperties;
    private final RefreshTokenService refreshTokenService;

    @GetMapping("/login")
    @Operation(
            summary = "카카오 로그인 시작",
            description = "카카오 OAuth 인가 페이지로 Redirect 합니다. state 값을 세션에 저장합니다."
    )
    @ApiResponses({
            @ApiResponse(responseCode = "302", description = "카카오 인가 페이지로 Redirect"),
            @ApiResponse(responseCode = "500", description = "서버 오류", content = @Content(schema = @Schema(implementation = ErrorResponse.class)))
    })
    public ResponseEntity<Void> loginWithKakao(HttpSession session, HttpServletRequest request) {
        String clientId = kakaoProperties.getClientId();
        String redirectUri = kakaoProperties.getRedirectUri();
        String authUrl = kakaoProperties.authUrl();

        String state = OAuthUtil.generateState();
        session.setAttribute(SESSION_STATE, state);

        String referer = request.getHeader("Referer");

        boolean isLocalDev =
                referer != null && (referer.startsWith("http://localhost") || referer.startsWith("http://127.0.0.1"));

        session.setAttribute(SESSION_LOCAL_DEV, isLocalDev);

        String redirect = UriComponentsBuilder.fromUriString(authUrl)
                .queryParam("response_type", "code")
                .queryParam("client_id", clientId)
                .queryParam("redirect_uri", redirectUri)
                .queryParam("state", state)
                .build()
                .toUriString();

        return ResponseEntity.status(302)
                .header(HttpHeaders.LOCATION, redirect)
                .build();
    }

    @GetMapping("/callback")
    @Operation(
            summary = "카카오 OAuth 콜백",
            description = "카카오에서 전달된 code/state를 검증하고 토큰을 발급한 뒤, access_token/refresh_token 쿠키를 설정하고 프론트로 Redirect 합니다."
    )
    @ApiResponses({
            @ApiResponse(responseCode = "302", description = "프론트 Redirect + Set-Cookie(access_token, refresh_token)"),
            @ApiResponse(responseCode = "400", description = "OAuth state 불일치", content = @Content(schema = @Schema(implementation = ErrorResponse.class))),
            @ApiResponse(responseCode = "401", description = "유효하지 않은 OAuth ID Token", content = @Content(schema = @Schema(implementation = ErrorResponse.class))),
            @ApiResponse(responseCode = "500", description = "서버 오류", content = @Content(schema = @Schema(implementation = ErrorResponse.class)))
    })
    public ResponseEntity<Void> kakaoCallback(
            HttpSession session,
            @RequestParam("code") String code,
            @RequestParam("state") String state
    ) {
        String sessionState = (String) session.getAttribute(SESSION_STATE);

        if (sessionState == null || !sessionState.equals(state)) {
            throw new CustomException(ErrorCode.INVALID_OAUTH_STATE);
        }

        boolean isLocalDev = Boolean.TRUE.equals(
                session.getAttribute(SESSION_LOCAL_DEV)
        );

        session.invalidate();

        IssuedTokens tokens = authService.handleKakaoCallback(code);

        ResponseCookie accessCookie = authCookieFactory.access(tokens.accessToken());
        ResponseCookie refreshCookie = authCookieFactory.refresh(tokens.refreshToken());

        String redirect = isLocalDev ? oAuthRedirectProperties.getLocal() : oAuthRedirectProperties.getProd();

        return ResponseEntity.status(302)
                .header(HttpHeaders.LOCATION, redirect)
                .header(HttpHeaders.SET_COOKIE, accessCookie.toString())
                .header(HttpHeaders.SET_COOKIE, refreshCookie.toString())
                .build();
    }

    @PostMapping("/refresh")
    @Operation(
            summary = "토큰 재발급",
            description = "쿠키의 refresh_token을 검증한 뒤 새 토큰을 발급합니다."
    )
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "재발급 성공 (응답 바디 없음, Set-Cookie로 토큰 갱신)"),
            @ApiResponse(responseCode = "401", description = "refresh_token 없음/만료/유효하지 않음", content = @Content(schema = @Schema(implementation = ErrorResponse.class))),
            @ApiResponse(responseCode = "500", description = "서버 오류", content = @Content(schema = @Schema(implementation = ErrorResponse.class)))
    })
    public ResponseEntity<Void> refresh(
            @Parameter(
                    in = ParameterIn.COOKIE,
                    name = "refresh_token",
                    description = "Refresh Token 쿠키",
                    required = true
            )
            @CookieValue(value = "refresh_token", required = false) String refreshToken
    ) {
        IssuedTokens tokens = authService.refresh(refreshToken);

        ResponseCookie accessCookie = authCookieFactory.access(tokens.accessToken());
        ResponseCookie refreshCookie = authCookieFactory.refresh(tokens.refreshToken());

        return ResponseEntity.noContent()
                .header(HttpHeaders.SET_COOKIE, accessCookie.toString())
                .header(HttpHeaders.SET_COOKIE, refreshCookie.toString())
                .build();
    }

    @PostMapping("/logout")
    @Operation(
            summary = "로그아웃",
            description = "쿠키의 refresh_token을 기반으로 access_token/refresh_token을 만료 처리합니다"
    )
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "로그아웃 성공 (응답 바디 없음, Set-Cookie로 쿠키 만료)"),
            @ApiResponse(responseCode = "500", description = "서버 오류", content = @Content(schema = @Schema(implementation = ErrorResponse.class)))
    })
    public ResponseEntity<Void> logout(
            @Parameter(
                    in = ParameterIn.COOKIE,
                    name = "refresh_token",
                    description = "Refresh Token 쿠키 (없어도 로그아웃 처리됨)"
            )
            @CookieValue(value = "refresh_token", required = false) String refreshToken
    ) {
        refreshTokenService.deleteByRefreshToken(refreshToken);

        ResponseCookie expiredAccess = authCookieFactory.deleteAccess();
        ResponseCookie expiredRefresh = authCookieFactory.deleteRefresh();

        return ResponseEntity.noContent()
                .header(HttpHeaders.SET_COOKIE, expiredAccess.toString())
                .header(HttpHeaders.SET_COOKIE, expiredRefresh.toString())
                .build();
    }
}