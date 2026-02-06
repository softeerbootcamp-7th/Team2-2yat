package com.yat2.episode.api.auth.security;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.jspecify.annotations.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.Arrays;
import java.util.Optional;

import com.yat2.episode.api.auth.jwt.JwtProvider;
import com.yat2.episode.api.global.constant.RequestAttrs;
import com.yat2.episode.api.global.exception.CustomException;
import com.yat2.episode.api.global.exception.ErrorCode;

import static com.yat2.episode.api.auth.cookie.AuthCookieNames.ACCESS_COOKIE_NAME;

@Component
@RequiredArgsConstructor
public class AuthInterceptor implements HandlerInterceptor {
    private final JwtProvider jwtProvider;

    @Override
    public boolean preHandle(
            @NonNull HttpServletRequest request, @NonNull HttpServletResponse response,
            @NonNull Object handler
    ) {
        if (!(handler instanceof HandlerMethod hm)) return true;

        if (hm.hasMethodAnnotation(Public.class) || hm.getBeanType().isAnnotationPresent(Public.class)) {
            return true;
        }

        String token = extractAccessToken(request).orElseThrow(() -> new CustomException(ErrorCode.UNAUTHORIZED));

        Long userId = jwtProvider.verifyAccessTokenAndGetUserId(token);
        request.setAttribute(RequestAttrs.USER_ID, userId);

        return true;
    }

    private Optional<String> extractAccessToken(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null || cookies.length == 0) return Optional.empty();

        return Arrays.stream(cookies).filter(c -> ACCESS_COOKIE_NAME.equals(c.getName())).map(Cookie::getValue)
                .map(v -> v == null ? "" : v.trim()).filter(v -> !v.isBlank()).findFirst();
    }
}
