package com.yat2.episode.api.auth.oauth;

import java.security.SecureRandom;
import java.util.Base64;

public final class OAuthUtil {

    private static final SecureRandom RANDOM = new SecureRandom();

    private OAuthUtil() {}

    public static String generateState() {
        byte[] bytes = new byte[32];
        RANDOM.nextBytes(bytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
    }
}
