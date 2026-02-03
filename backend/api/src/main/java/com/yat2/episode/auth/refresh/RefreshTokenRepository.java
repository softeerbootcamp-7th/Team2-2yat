package com.yat2.episode.auth.refresh;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.Optional;

public interface RefreshTokenRepository extends JpaRepository<RefreshToken, Long> {

    Optional<RefreshToken> findByTokenHash(String tokenHash);

    @Modifying
    @Query(value = """
            INSERT INTO refresh_token (user_id, token_hash, expires_at)
            VALUES (:userId, :tokenHash, :expiresAt)
            ON DUPLICATE KEY UPDATE
                token_hash = VALUES(token_hash),
                expires_at = VALUES(expires_at)
            """, nativeQuery = true)
    void upsertByUserId(@Param("userId") Long userId, @Param("tokenHash") String tokenHash,
                        @Param("expiresAt") LocalDateTime expiresAt);

    void deleteByUser_KakaoId(Long kakaoId);

    void deleteByTokenHash(String tokenHash);
}
