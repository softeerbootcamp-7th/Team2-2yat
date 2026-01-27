package com.yat2.episode.auth.config;

import lombok.Getter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "auth.redirect")
@Getter
public class AuthRedirectProperties {
    private String local;
    private String prod;
}