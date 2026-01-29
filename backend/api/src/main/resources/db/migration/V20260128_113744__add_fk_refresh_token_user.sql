ALTER TABLE refresh_token
    ADD CONSTRAINT fk_refresh_token_user
        FOREIGN KEY (user_id)
            REFERENCES users (kakao_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE;