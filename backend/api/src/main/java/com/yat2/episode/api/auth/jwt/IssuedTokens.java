package com.yat2.episode.api.auth.jwt;

public record IssuedTokens(
        String accessToken,
        String refreshToken
) {}
