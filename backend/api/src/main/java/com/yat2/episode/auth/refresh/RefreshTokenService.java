package com.yat2.episode.auth.refresh;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Base64;

import com.yat2.episode.auth.jwt.JwtProperties;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;

@Slf4j
@Service
@RequiredArgsConstructor
public class RefreshTokenService {

    private final RefreshTokenRepository refreshTokenRepository;
    private final JwtProperties jwtProperties;

    @Transactional
    public void save(Long userId, String refreshToken) {
        String tokenHash = hash(refreshToken);
        LocalDateTime expiresAt = LocalDateTime.now().plus(Duration.ofMillis(jwtProperties.getRefreshTokenExpiry()));

        refreshTokenRepository.upsertByUserId(userId, tokenHash, expiresAt);
    }

    @Transactional(readOnly = true)
    public void validateSession(String refreshToken) {
        String tokenHash = hash(refreshToken);

        refreshTokenRepository.findByTokenHash(tokenHash)
                .orElseThrow(() -> new CustomException(ErrorCode.INVALID_TOKEN));
    }

    @Transactional
    public void deleteByRefreshToken(String refreshToken) {
        if (refreshToken == null || refreshToken.isBlank()) return;

        try {
            refreshTokenRepository.deleteByTokenHash(hash(refreshToken));
        } catch (Exception e) {
            log.error("Failed to delete refresh token", e);
        }
    }

    private String hash(String token) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] bytes = digest.digest(token.getBytes(StandardCharsets.UTF_8));
            return Base64.getEncoder().encodeToString(bytes);
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException("Refresh token hashing failed", e);
        }
    }
}
