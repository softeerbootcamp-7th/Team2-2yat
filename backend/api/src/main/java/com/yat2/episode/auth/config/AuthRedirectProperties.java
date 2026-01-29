package com.yat2.episode.auth.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "auth.redirect")
@Getter @Setter
public class AuthRedirectProperties {
    private String local;
    private String prod;
}