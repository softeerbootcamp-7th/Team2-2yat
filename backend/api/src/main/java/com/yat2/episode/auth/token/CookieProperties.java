package com.yat2.episode.auth.token;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Getter @Setter
@ConfigurationProperties(prefix = "cookie")
public class CookieProperties {
    private String domain;
    private boolean secure;
    private String sameSite;
}