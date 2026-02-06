package com.yat2.episode.api.auth.cookie;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Getter
@Setter
@ConfigurationProperties(prefix = "cookie")
public class AuthCookieProperties {
    private String domain;
    private boolean secure;
    private String sameSite;
}
