package com.yat2.episode.auth.oauth;

import com.nimbusds.jose.JWSAlgorithm;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.jwk.source.RemoteJWKSet;
import com.nimbusds.jose.proc.JWSKeySelector;
import com.nimbusds.jose.proc.JWSVerificationKeySelector;
import com.nimbusds.jose.proc.SecurityContext;
import com.nimbusds.jose.util.DefaultResourceRetriever;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.proc.ConfigurableJWTProcessor;
import com.nimbusds.jwt.proc.DefaultJWTClaimsVerifier;
import com.nimbusds.jwt.proc.DefaultJWTProcessor;
import org.springframework.stereotype.Component;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.Set;

import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;

@Component
public class KakaoIdTokenVerifier {

    private final ConfigurableJWTProcessor<SecurityContext> jwtProcessor;
    private final DefaultJWTClaimsVerifier<SecurityContext> claimsVerifier;

    public KakaoIdTokenVerifier(KakaoProperties props) throws MalformedURLException {
        DefaultResourceRetriever retriever = new DefaultResourceRetriever(2000, 5000);

        JWKSource<SecurityContext> jwkSource = new RemoteJWKSet<>(new URL(props.jwksUrl()), retriever);

        JWSKeySelector<SecurityContext> keySelector = new JWSVerificationKeySelector<>(JWSAlgorithm.RS256, jwkSource);

        DefaultJWTProcessor<SecurityContext> processor = new DefaultJWTProcessor<>();
        processor.setJWSKeySelector(keySelector);

        this.jwtProcessor = processor;

        JWTClaimsSet expectedClaims =
                new JWTClaimsSet.Builder().issuer(props.issuer()).audience(props.getClientId()).build();

        this.claimsVerifier = new DefaultJWTClaimsVerifier<>(expectedClaims, Set.of("sub", "exp", "iat"));
    }

    public JWTClaimsSet verify(String idToken) {
        try {
            JWTClaimsSet claims = jwtProcessor.process(idToken, null);

            claimsVerifier.verify(claims, null);

            return claims;
        } catch (Exception e) {
            throw new CustomException(ErrorCode.INVALID_OAUTH_ID_TOKEN);
        }
    }
}
