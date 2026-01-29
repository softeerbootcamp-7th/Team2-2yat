package com.yat2.episode.auth.oauth;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "auth.redirect")
@Getter @Setter
public class OAuthRedirectProperties {
    private String local;
    private String prod;
}