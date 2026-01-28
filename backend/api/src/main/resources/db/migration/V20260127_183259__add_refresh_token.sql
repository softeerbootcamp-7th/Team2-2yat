CREATE TABLE refresh_token
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id    BIGINT       NOT NULL,
    token_hash VARCHAR(255) NOT NULL,
    expires_at DATETIME     NOT NULL,
    created_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    UNIQUE KEY uk_refresh_token_hash (token_hash),
    UNIQUE KEY uk_refresh_token_user_id (user_id),
    KEY        idx_refresh_token_expires_at (expires_at),
    KEY        idx_refresh_token_updated_at (updated_at)
) ENGINE=InnoDB;