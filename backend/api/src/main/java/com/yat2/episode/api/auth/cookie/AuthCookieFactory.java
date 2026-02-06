package com.yat2.episode.api.auth.cookie;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseCookie;
import org.springframework.stereotype.Component;

import java.time.Duration;

import com.yat2.episode.api.auth.jwt.JwtProperties;

import static com.yat2.episode.api.auth.cookie.AuthCookieNames.ACCESS_COOKIE_NAME;
import static com.yat2.episode.api.auth.cookie.AuthCookieNames.REFRESH_COOKIE_NAME;

@Component
@RequiredArgsConstructor
public class AuthCookieFactory {

    private final AuthCookieProperties cookieProps;
    private final JwtProperties jwtProps;

    public ResponseCookie access(String token) {
        return build(Spec.ACCESS, token, Duration.ofMillis(jwtProps.getAccessTokenExpiry()));
    }

    public ResponseCookie refresh(String token) {
        return build(Spec.REFRESH, token, Duration.ofMillis(jwtProps.getRefreshTokenExpiry()));
    }

    public ResponseCookie deleteAccess() {
        return delete(Spec.ACCESS);
    }

    public ResponseCookie deleteRefresh() {
        return delete(Spec.REFRESH);
    }

    private ResponseCookie build(Spec spec, String value, Duration maxAge) {
        ResponseCookie.ResponseCookieBuilder builder =
                ResponseCookie.from(spec.name, value).httpOnly(true).secure(cookieProps.isSecure())
                        .sameSite(cookieProps.getSameSite()).path(spec.path).maxAge(maxAge);

        if (cookieProps.getDomain() != null && !cookieProps.getDomain().isBlank()) {
            builder.domain(cookieProps.getDomain());
        }

        return builder.build();
    }

    private ResponseCookie delete(Spec spec) {
        ResponseCookie.ResponseCookieBuilder builder =
                ResponseCookie.from(spec.name, "").httpOnly(true).secure(cookieProps.isSecure())
                        .sameSite(cookieProps.getSameSite()).path(spec.path).maxAge(Duration.ZERO);

        if (cookieProps.getDomain() != null && !cookieProps.getDomain().isBlank()) {
            builder.domain(cookieProps.getDomain());
        }

        return builder.build();
    }

    enum Spec {
        ACCESS(ACCESS_COOKIE_NAME, "/api"), REFRESH(REFRESH_COOKIE_NAME, "/api/auth");

        final String name;
        final String path;

        Spec(String name, String path) {
            this.name = name;
            this.path = path;
        }
    }
}
