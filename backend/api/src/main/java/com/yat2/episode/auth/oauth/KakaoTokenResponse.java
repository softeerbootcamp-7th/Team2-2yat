package com.yat2.episode.auth.oauth;

import com.fasterxml.jackson.annotation.JsonProperty;

public record KakaoTokenResponse(
        @JsonProperty("access_token") String accessToken,

        @JsonProperty("refresh_token") String refreshToken,

        @JsonProperty("id_token") String idToken,

        @JsonProperty("expires_in") Integer expiresIn,

        @JsonProperty("refresh_token_expires_in") Integer refreshTokenExpiresIn,

        @JsonProperty("token_type") String tokenType,

        @JsonProperty("scope") String scope
) {}
