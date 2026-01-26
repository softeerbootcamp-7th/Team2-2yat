package com.yat2.episode.auth.oauth;

import com.yat2.episode.auth.dto.KakaoTokenResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;

@Component
@RequiredArgsConstructor
public class KakaoOAuthClient {
    private final KakaoProperties kakaoProperties;
    private final WebClient webClient = WebClient.builder().build();

    public KakaoTokenResponse requestToken(String code) {
        return webClient.post()
                .uri(kakaoProperties.tokenUrl())
                .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                .body(BodyInserters.fromFormData("grant_type", "authorization_code")
                        .with("client_id", kakaoProperties.getClientId())
                        .with("client_secret", kakaoProperties.getClientSecret())
                        .with("redirect_uri", kakaoProperties.getRedirectUri())
                        .with("code", code)
                )
                .retrieve()
                .bodyToMono(KakaoTokenResponse.class)
                .block();
    }
}