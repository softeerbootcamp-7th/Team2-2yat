package com.yat2.episode.auth;

import com.yat2.episode.auth.config.AuthRedirectProperties;
import com.yat2.episode.auth.dto.IssuedTokens;
import com.yat2.episode.auth.config.KakaoProperties;
import com.yat2.episode.auth.oauth.OAuthUtil;
import com.yat2.episode.auth.token.AuthCookieFactory;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/auth")
@Tag(name = "Auth", description = "카카오 OAuth 로그인 및 토큰 재발급 API")
public class AuthController {
    private static final String SESSION_STATE = "OAUTH_STATE";
    private static final String SESSION_LOCAL_DEV = "OAUTH_LOCAL_DEV";

    private final KakaoProperties kakaoProperties;
    private final AuthService authService;
    private final AuthCookieFactory authCookieFactory;
    private final AuthRedirectProperties authRedirectProperties;

    @GetMapping("/login")
    @Operation(
            summary = "카카오 로그인 시작",
            description = "카카오 OAuth 인가 페이지로 Redirect 합니다. state 값을 세션에 저장합니다."
    )
    @ApiResponses({
            @ApiResponse(responseCode = "302", description = "카카오 인가 페이지로 Redirect"),
            @ApiResponse(responseCode = "500", description = "서버 오류", content = @Content)
    })
    public RedirectView loginWithKakao(HttpSession session, HttpServletRequest request) {
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

        return new RedirectView(redirect);
    }

    @GetMapping("/callback")
    @Operation(
            summary = "카카오 OAuth 콜백",
            description = "카카오에서 전달된 code/state를 검증하고 토큰을 발급한 뒤, access_token/refresh_token 쿠키를 설정하고 프론트로 Redirect 합니다."
    )
    @ApiResponses({
            @ApiResponse(responseCode = "302", description = "프론트 Redirect + Set-Cookie(access_token, refresh_token)"),
            @ApiResponse(responseCode = "400", description = "OAuth state 불일치", content = @Content),
            @ApiResponse(responseCode = "401", description = "유효하지 않은 OAuth ID Token", content = @Content),
            @ApiResponse(responseCode = "500", description = "서버 오류", content = @Content)
    })
    public RedirectView kakaoCallback(
            HttpSession session,
            @RequestParam("code") String code,
            @RequestParam("state") String state,
            HttpServletResponse response
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

        response.addHeader(HttpHeaders.SET_COOKIE, accessCookie.toString());
        response.addHeader(HttpHeaders.SET_COOKIE, refreshCookie.toString());

        String redirect = isLocalDev ? authRedirectProperties.getLocal() : authRedirectProperties.getProd();

        return new RedirectView(redirect);
    }

    @PostMapping("/refresh")
    @Operation(
            summary = "토큰 재발급",
            description = "쿠키의 refresh_token을 검증(JWT 검증 + DB 세션 검증)한 뒤 새 토큰을 발급합니다. 성공 시 access_token(및 refresh_token) 쿠키를 재설정합니다."
    )
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "재발급 성공 (응답 바디 없음, Set-Cookie로 토큰 갱신)"),
            @ApiResponse(responseCode = "401", description = "refresh_token 없음/만료/유효하지 않음", content = @Content),
            @ApiResponse(responseCode = "500", description = "서버 오류", content = @Content)
    })
    public ResponseEntity<Void> refresh(
            @Parameter(
                    in = ParameterIn.COOKIE,
                    name = "refresh_token",
                    description = "Refresh Token 쿠키",
                    required = true
            )
            @CookieValue(value = "refresh_token", required = false) String refreshToken,
            HttpServletResponse response
    ) {
        IssuedTokens tokens = authService.refresh(refreshToken);

        ResponseCookie accessCookie = authCookieFactory.access(tokens.accessToken());
        ResponseCookie refreshCookie = authCookieFactory.refresh(tokens.refreshToken());

        response.addHeader(HttpHeaders.SET_COOKIE, accessCookie.toString());
        response.addHeader(HttpHeaders.SET_COOKIE, refreshCookie.toString());

        return ResponseEntity.noContent().build();
    }
}