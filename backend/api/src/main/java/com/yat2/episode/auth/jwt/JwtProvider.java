package com.yat2.episode.auth.jwt;

import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import org.springframework.stereotype.Component;

import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.Date;
import java.util.UUID;

@Component
public class JwtProvider {

    private static final String CLAIM_TOKEN_TYPE = "typ";
    private static final String TYPE_ACCESS = "access";
    private static final String TYPE_REFRESH = "refresh";

    private final JwtProperties props;
    private final byte[] secretBytes;

    public JwtProvider(JwtProperties props) {
        this.props = props;
        this.secretBytes = props.getSecret().getBytes(StandardCharsets.UTF_8);

        if (secretBytes.length < 32) {
            throw new IllegalStateException("JWT secret is too short");
        }
    }

    public IssuedTokens issueTokens(Long userId) {
        String access = issueToken(userId, TYPE_ACCESS, props.getAccessTokenExpiry());
        String refresh = issueToken(userId, TYPE_REFRESH, props.getRefreshTokenExpiry());
        return new IssuedTokens(access, refresh);
    }

    private String issueToken(Long userId, String type, long ttlMillis) {
        Instant now = Instant.now();

        JWTClaimsSet claims = new JWTClaimsSet.Builder()
                .issuer(props.getIssuer())
                .subject(String.valueOf(userId))
                .issueTime(Date.from(now))
                .expirationTime(Date.from(now.plusMillis(ttlMillis)))
                .jwtID(UUID.randomUUID().toString())
                .claim(CLAIM_TOKEN_TYPE, type)
                .build();

        try {
            SignedJWT jwt = new SignedJWT(
                    new JWSHeader(JWSAlgorithm.HS256),
                    claims
            );
            jwt.sign(new MACSigner(secretBytes));
            return jwt.serialize();
        } catch (JOSEException e) {
            throw new CustomException(ErrorCode.INTERNAL_ERROR);
        }
    }

    public Long verifyAccessTokenAndGetUserId(String token) {
        JWTClaimsSet claims = verify(token, TYPE_ACCESS);
        return Long.parseLong(claims.getSubject());
    }

    public Long verifyRefreshTokenAndGetUserId(String token) {
        JWTClaimsSet claims = verify(token, TYPE_REFRESH);
        return Long.parseLong(claims.getSubject());
    }

    private JWTClaimsSet verify(String token, String expectedType) {
        try {
            SignedJWT jwt = SignedJWT.parse(token);

            if (!jwt.verify(new MACVerifier(secretBytes))) {
                throw new CustomException(ErrorCode.INVALID_TOKEN_SIGNATURE);
            }

            JWTClaimsSet claims = jwt.getJWTClaimsSet();

            if (!props.getIssuer().equals(claims.getIssuer())) {
                throw new CustomException(ErrorCode.INVALID_TOKEN_ISSUER);
            }

            if (claims.getExpirationTime() == null ||
                    new Date().after(claims.getExpirationTime())) {
                throw new CustomException(ErrorCode.TOKEN_EXPIRED);
            }

            String type = (String) claims.getClaim(CLAIM_TOKEN_TYPE);
            if (!expectedType.equals(type)) {
                throw new CustomException(ErrorCode.INVALID_TOKEN_TYPE);
            }

            return claims;
        } catch (CustomException e) {
            throw e;
        } catch (Exception e) {
            throw new CustomException(ErrorCode.INVALID_TOKEN);
        }
    }
}