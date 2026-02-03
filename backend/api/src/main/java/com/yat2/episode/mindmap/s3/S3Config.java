package com.yat2.episode.mindmap.s3;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;
import software.amazon.awssdk.auth.credentials.DefaultCredentialsProvider;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Configuration;
import software.amazon.awssdk.services.s3.presigner.S3Presigner;

import java.net.URI;

@Configuration
@RequiredArgsConstructor
public class S3Config {

    private final S3Properties s3Properties;

    @Bean
    @Profile("local")
    public AwsCredentialsProvider localCredentialsProvider() {
        return StaticCredentialsProvider.create(
                AwsBasicCredentials.create(s3Properties.getAccessKey(), s3Properties.getSecretKey()));
    }

    @Bean
    @Profile("prod")
    public AwsCredentialsProvider prodCredentialsProvider() {
        return DefaultCredentialsProvider.create(); // 여기서 EC2 Role을 알아서 찾아옴
    }


    @Bean
    @Profile("local")
    public S3Presigner localS3Presigner(AwsCredentialsProvider credentialsProvider) {
        return S3Presigner.builder().region(Region.of(s3Properties.getRegion()))
                .endpointOverride(URI.create(s3Properties.getEndpoint())).credentialsProvider(credentialsProvider)
                .serviceConfiguration(S3Configuration.builder().pathStyleAccessEnabled(true).build()).build();
    }

    @Bean
    @Profile("prod")
    public S3Presigner prodS3Presigner(AwsCredentialsProvider credentialsProvider) {
        return S3Presigner.builder().region(Region.of(s3Properties.getRegion()))
                .credentialsProvider(credentialsProvider).build();
    }
}
