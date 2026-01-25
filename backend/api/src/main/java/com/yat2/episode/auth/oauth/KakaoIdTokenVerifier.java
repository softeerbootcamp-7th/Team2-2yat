package com.yat2.episode.auth.oauth;

import com.nimbusds.jose.JWSAlgorithm;
import com.nimbusds.jose.proc.JWSKeySelector;
import com.nimbusds.jose.proc.JWSVerificationKeySelector;
import com.nimbusds.jose.util.DefaultResourceRetriever;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.proc.ConfigurableJWTProcessor;
import com.nimbusds.jwt.proc.DefaultJWTProcessor;
import com.yat2.episode.auth.KakaoProperties;
import org.springframework.stereotype.Component;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.jwk.source.RemoteJWKSet;
import com.nimbusds.jose.proc.SecurityContext;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;

@Component
public class KakaoIdTokenVerifier {

    private final ConfigurableJWTProcessor<SecurityContext> jwtProcessor;
    private final KakaoProperties props;

    public KakaoIdTokenVerifier(KakaoProperties props) throws MalformedURLException {
        this.props = props;

        DefaultResourceRetriever retriever =
                new DefaultResourceRetriever(2000, 5000);

        JWKSource<SecurityContext> jwkSource =
                new RemoteJWKSet<>(
                        new URL(props.jwksUrl()),
                        retriever
                );

        JWSKeySelector<SecurityContext> keySelector =
                new JWSVerificationKeySelector<>(
                        JWSAlgorithm.RS256,
                        jwkSource
                );

        DefaultJWTProcessor<SecurityContext> processor =
                new DefaultJWTProcessor<>();
        processor.setJWSKeySelector(keySelector);

        this.jwtProcessor = processor;
    }

    public JWTClaimsSet verify(String idToken) throws Exception {
        JWTClaimsSet claims = jwtProcessor.process(idToken, null);

        if (!props.issuer().equals(claims.getIssuer())) {
            throw new IllegalStateException("Invalid issuer");
        }

        if (!claims.getAudience().contains(props.getClientId())) {
            throw new IllegalStateException("Invalid audience");
        }

        Date now = new Date();
        if (claims.getExpirationTime() == null ||
                now.after(claims.getExpirationTime())) {
            throw new IllegalStateException("Token expired");
        }

        return claims;
    }
}