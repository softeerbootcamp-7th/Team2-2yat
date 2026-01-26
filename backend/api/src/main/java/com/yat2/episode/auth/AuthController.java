package com.yat2.episode.auth;

import com.yat2.episode.auth.dto.IssuedTokens;
import com.yat2.episode.auth.oauth.KakaoProperties;
import com.yat2.episode.auth.oauth.OAuthUtil;
import com.yat2.episode.auth.token.AuthCookieFactory;
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

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/auth")
public class AuthController {

    private final KakaoProperties kakaoProperties;
    private final AuthService authService;
    private final AuthCookieFactory authCookieFactory;

    @GetMapping("/login")
    public RedirectView loginWithKakao(HttpSession session) {
        String clientId = kakaoProperties.getClientId();
        String redirectUri = kakaoProperties.getRedirectUri();
        String authUrl = kakaoProperties.authUrl();

        String state = OAuthUtil.generateState();
        session.setAttribute("OAUTH_STATE", state);

        String redirect = authUrl +
                "?response_type=code" +
                "&client_id=" + clientId +
                "&redirect_uri=" + redirectUri +
                "&state=" + state;

        return new RedirectView(redirect);
    }

    @GetMapping("/callback")
    public RedirectView kakaoCallback(
            HttpSession session,
            @RequestParam("code") String code,
            @RequestParam("state") String state,
            HttpServletResponse response
    ) {
        IssuedTokens tokens = authService.handleKakaoCallback(session, code, state);

        ResponseCookie accessCookie = authCookieFactory.access(tokens.accessToken());
        ResponseCookie refreshCookie = authCookieFactory.refresh(tokens.refreshToken());

        response.addHeader(HttpHeaders.SET_COOKIE, accessCookie.toString());
        response.addHeader(HttpHeaders.SET_COOKIE, refreshCookie.toString());

        //TODO: redirect target state로 설정
        return new RedirectView("http://localhost:5173");
    }
}