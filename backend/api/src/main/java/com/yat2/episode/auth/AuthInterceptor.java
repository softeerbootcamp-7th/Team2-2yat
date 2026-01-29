package com.yat2.episode.auth;

import com.yat2.episode.auth.annotation.Public;
import com.yat2.episode.auth.token.JwtProvider;
import com.yat2.episode.global.constant.RequestAttrs;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.jspecify.annotations.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import static com.yat2.episode.auth.token.AuthCookieNames.ACCESS_COOKIE_NAME;

@Component
@RequiredArgsConstructor
public class AuthInterceptor implements HandlerInterceptor {
    private final JwtProvider jwtProvider;

    @Override
    public boolean preHandle(@NonNull HttpServletRequest request, @NonNull HttpServletResponse response, @NonNull Object handler) {
        if (!(handler instanceof HandlerMethod hm)) return true;

        if (hm.hasMethodAnnotation(Public.class) || hm.getBeanType().isAnnotationPresent(Public.class)) {
            return true;
        }

        String token = extractAccessToken(request);
        if (token == null || token.isBlank()) {
            throw new CustomException(ErrorCode.UNAUTHORIZED);
        }

        Long userId = jwtProvider.verifyAccessTokenAndGetUserId(token);
        request.setAttribute(RequestAttrs.USER_ID, userId);

        return true;
    }

    private String extractAccessToken(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null) return null;
        for (Cookie c : cookies) {
            if (ACCESS_COOKIE_NAME.equals(c.getName())) return c.getValue();
        }
        return null;
    }
}