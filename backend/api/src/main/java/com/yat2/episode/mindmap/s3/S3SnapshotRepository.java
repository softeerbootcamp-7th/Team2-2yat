package com.yat2.episode.mindmap.s3;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;
import software.amazon.awssdk.auth.credentials.AwsCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;

import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.mindmap.s3.dto.S3UploadResponseDto;

@Slf4j
@Repository
public class S3SnapshotRepository {
    private final S3PostSigner s3PostSigner;
    private final AwsCredentialsProvider credentialsProvider;
    private final String bucketName;
    private final String region;
    private final String endpoint;

    public S3SnapshotRepository(S3PostSigner s3PostSigner, AwsCredentialsProvider credentialsProvider,
                                S3Properties s3Properties) {
        this.s3PostSigner = s3PostSigner;
        this.credentialsProvider = credentialsProvider;
        this.bucketName = s3Properties.getBucket().getName();
        this.region = s3Properties.getRegion();
        this.endpoint = s3Properties.getEndpoint();
    }

    public S3UploadResponseDto createPresignedUploadInfo(String objectKey) {
        try {
            AwsCredentials credentials = credentialsProvider.resolveCredentials();

            return s3PostSigner.generatePostFields(bucketName, objectKey, region, endpoint, credentials);
        } catch (Exception e) {
            log.error(e.getMessage());
            throw new CustomException(ErrorCode.S3_URL_FAIL);
        }
    }
}
