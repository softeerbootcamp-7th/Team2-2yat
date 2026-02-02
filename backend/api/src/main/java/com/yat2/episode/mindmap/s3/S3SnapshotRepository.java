package com.yat2.episode.mindmap.s3;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;
import software.amazon.awssdk.auth.credentials.AwsCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;
import java.util.Map;

@Repository
public class S3SnapshotRepository {
    private final S3PostSigner s3PostSigner;
    private final AwsCredentialsProvider credentialsProvider;
    private final String bucketName;
    private final String region;
    private final String endpoint;

    public S3SnapshotRepository(
            S3PostSigner s3PostSigner,
            AwsCredentialsProvider credentialsProvider,
            S3Properties s3Properties
    ) {
        this.s3PostSigner = s3PostSigner;
        this.credentialsProvider = credentialsProvider;
        this.bucketName = s3Properties.getBucket().getName();
        this.region = s3Properties.getRegion();
        this.endpoint = s3Properties.getEndpoint();
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