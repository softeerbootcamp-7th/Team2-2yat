package com.yat2.episode.auth;

import com.yat2.episode.auth.config.AuthRedirectProperties;
import com.yat2.episode.auth.dto.IssuedTokens;
import com.yat2.episode.auth.config.KakaoProperties;
import com.yat2.episode.auth.oauth.OAuthUtil;
import com.yat2.episode.auth.token.AuthCookieFactory;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/auth")
public class AuthController {

    private final KakaoProperties kakaoProperties;
    private final AuthService authService;
    private final AuthCookieFactory authCookieFactory;
    private final AuthRedirectProperties authRedirectProperties;

    @GetMapping("/login")
    public RedirectView loginWithKakao(HttpSession session, HttpServletRequest request) {
        String clientId = kakaoProperties.getClientId();
        String redirectUri = kakaoProperties.getRedirectUri();
        String authUrl = kakaoProperties.authUrl();

        String state = OAuthUtil.generateState();
        session.setAttribute("OAUTH_STATE", state);

        String referer = request.getHeader("Referer");

        boolean isLocalDev =
                referer != null && referer.startsWith("http://localhost");

        session.setAttribute("OAUTH_LOCAL_DEV", isLocalDev);

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
    public RedirectView kakaoCallback(
            HttpSession session,
            @RequestParam("code") String code,
            @RequestParam("state") String state,
            HttpServletResponse response
    ) {
        String sessionState = (String) session.getAttribute("OAUTH_STATE");

        if (sessionState == null || !sessionState.equals(state)) {
            throw new IllegalStateException("Invalid OAuth state");
        }

        boolean isLocalDev = Boolean.TRUE.equals(
                session.getAttribute("OAUTH_LOCAL_DEV")
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
}