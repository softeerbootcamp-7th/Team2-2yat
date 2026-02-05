package com.yat2.episode.mindmap.s3;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;

import java.util.Base64;

import com.yat2.episode.mindmap.s3.dto.S3UploadResponseDto;

import static org.assertj.core.api.Assertions.assertThat;

class S3PostSignerTest {

    private S3PostSigner s3PostSigner;
    private S3Properties s3Properties;

    @BeforeEach
    void setUp() {
        s3Properties = new S3Properties();
        s3Properties.setRegion("ap-northeast-2");
        s3Properties.setEndpoint("https://s3.ap-northeast-2.amazonaws.com");

        S3Properties.Bucket bucket = new S3Properties.Bucket();
        bucket.setName("episode-bucket");
        s3Properties.setBucket(bucket);

        s3Properties.setMaxUploadSize(10485760L);

        s3PostSigner = new S3PostSigner(s3Properties);
    }

    @Test
    @DisplayName("S3 Post Signer는 유효한 action URL과 필드들을 생성해야 한다")
    void generatePostFields_Success() throws Exception {
        String key = "mindmaps/test-uuid";
        AwsBasicCredentials credentials = AwsBasicCredentials.create("test-access-key", "test-secret-key");
        S3UploadResponseDto response = s3PostSigner.generatePostFields(key, credentials);

        assertThat(response.action()).contains("episode-bucket");
        assertThat(response.fields().key()).isEqualTo(key);
        assertThat(response.fields().algorithm()).isEqualTo("AWS4-HMAC-SHA256");
        assertThat(response.fields().credential()).contains("test-access-key");
        assertThat(response.fields().credential()).contains("ap-northeast-2");
        assertThat(response.fields().signature()).isNotEmpty();
        assertThat(response.fields().policy()).isNotEmpty();
    }

    @Test
    @DisplayName("생성된 Policy(Base64)를 디코딩하면 설정한 제약 조건이 포함되어 있어야 한다")
    void policyContent_ShouldContainCorrectConstraints() throws Exception {
        String key = "test-key";
        AwsBasicCredentials credentials = AwsBasicCredentials.create("access", "secret");

        S3UploadResponseDto response = s3PostSigner.generatePostFields(key, credentials);
        String decodedPolicy = new String(Base64.getDecoder().decode(response.fields().policy()));

        assertThat(decodedPolicy).contains("\"bucket\":\"episode-bucket\"");
        assertThat(decodedPolicy).contains("\"key\":\"" + key + "\"");
        assertThat(decodedPolicy).contains("content-length-range");
    }
}
