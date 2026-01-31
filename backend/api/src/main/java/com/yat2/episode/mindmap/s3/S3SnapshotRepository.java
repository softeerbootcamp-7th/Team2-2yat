package com.yat2.episode.mindmap.s3;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;
import software.amazon.awssdk.auth.credentials.AwsCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.presigner.S3Presigner;
import software.amazon.awssdk.services.s3.presigner.model.PutObjectPresignRequest;
import software.amazon.awssdk.services.s3.presigner.model.PresignedPutObjectRequest;

import java.time.Duration;
import java.util.Map;

@Repository
public class S3SnapshotRepository {
    private final S3PostSigner s3PostSigner;
    private final AwsCredentialsProvider credentialsProvider; // ⭐️ 이게 핵심!
    private final String bucketName;
    private final String region;
    private final String endpoint;

    public S3SnapshotRepository(
            S3PostSigner s3PostSigner,
            AwsCredentialsProvider credentialsProvider,
            @Value("${aws.s3.bucket.name}") String bucketName,
            @Value("${aws.s3.region}") String region,
            @Value("${s3.endpoint:}") String endpoint
    ) {
        this.s3PostSigner = s3PostSigner;
        this.credentialsProvider = credentialsProvider;
        this.bucketName = bucketName;
        this.region = region;
        this.endpoint = endpoint;
    }

    public Map<String, String> createPresignedUploadInfo(String objectKey) {
        AwsCredentials credentials = credentialsProvider.resolveCredentials();

        return s3PostSigner.generatePostFields(
                bucketName,
                objectKey,
                region,
                endpoint,
                credentials
        );
    }
}