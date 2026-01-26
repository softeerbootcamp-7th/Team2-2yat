package com.yat2.episode.auth.dto;

public record IssuedTokens(
        String accessToken,
        String refreshToken
) {}