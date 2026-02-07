package com.yat2.episode.mindmap.s3;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import software.amazon.awssdk.auth.credentials.AwsCredentials;

import com.yat2.episode.mindmap.s3.dto.S3UploadResponseDto;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.mock;

@ExtendWith(MockitoExtension.class)
@DisplayName("S3PostSigner 단위 테스트")
class S3PostSignerTest {

    @Mock
    private S3Properties s3Properties;

    private S3PostSigner s3PostSigner;

    @BeforeEach
    void setUp() {
        S3Properties.Bucket bucket = new S3Properties.Bucket();
        bucket.setName("test-bucket");

        given(s3Properties.getBucket()).willReturn(bucket);
        given(s3Properties.getRegion()).willReturn("ap-northeast-2");
        given(s3Properties.getMaxUploadSize()).willReturn(10485760L);
        given(s3Properties.getEndpoint()).willReturn("https://s3.ap-northeast-2.amazonaws.com");

        s3PostSigner = new S3PostSigner(s3Properties);
    }

    @Nested
    @DisplayName("generatePostFields")
    class GeneratePostFieldsTest {

        @Test
        @DisplayName("S3 업로드용 Policy와 Signature가 포함된 응답을 생성한다")
        void should_generate_valid_post_fields() throws Exception {
            String objectKey = "mindmaps/test-uuid";
            AwsCredentials credentials = mock(AwsCredentials.class);
            given(credentials.accessKeyId()).willReturn("test-access-key");
            given(credentials.secretAccessKey()).willReturn("test-secret-key");

            S3UploadResponseDto response = s3PostSigner.generatePostFields(objectKey, credentials);

            assertThat(response).isNotNull();
            assertThat(response.action()).contains("test-bucket");
            assertThat(response.fields().key()).isEqualTo(objectKey);
            assertThat(response.fields().policy()).isNotBlank();
            assertThat(response.fields().signature()).isNotBlank();
            assertThat(response.fields().algorithm()).isEqualTo("AWS4-HMAC-SHA256");
        }
    }
}