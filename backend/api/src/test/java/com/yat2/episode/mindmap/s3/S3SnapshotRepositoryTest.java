package com.yat2.episode.mindmap.s3;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import software.amazon.awssdk.auth.credentials.AwsCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;

import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.mindmap.s3.dto.S3UploadResponseDto;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.any;
import static org.mockito.Mockito.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

@ExtendWith(MockitoExtension.class)
@DisplayName("S3SnapshotRepository 단위 테스트")
class S3SnapshotRepositoryTest {

    @Mock
    private S3PostSigner s3PostSigner;

    @Mock
    private AwsCredentialsProvider credentialsProvider;

    @InjectMocks
    private S3SnapshotRepository s3SnapshotRepository;

    @Nested
    @DisplayName("createPresignedUploadInfo")
    class CreatePresignedUploadInfoTest {

        @Test
        @DisplayName("인증 정보를 성공적으로 가져와 업로드 정보를 생성한다")
        void should_return_upload_info_when_credentials_are_valid() throws Exception {
            String objectKey = "mindmaps/test-key";
            AwsCredentials credentials = mock(AwsCredentials.class);
            S3UploadResponseDto expectedResponse = mock(S3UploadResponseDto.class);

            given(credentialsProvider.resolveCredentials()).willReturn(credentials);
            given(s3PostSigner.generatePostFields(objectKey, credentials)).willReturn(expectedResponse);

            S3UploadResponseDto result = s3SnapshotRepository.createPresignedUploadInfo(objectKey);

            assertThat(result).isEqualTo(expectedResponse);
            verify(credentialsProvider).resolveCredentials();
            verify(s3PostSigner).generatePostFields(objectKey, credentials);
        }

        @Test
        @DisplayName("서명 생성 중 예외가 발생하면 S3_URL_FAIL 커스텀 예외를 던진다")
        void should_throw_custom_exception_when_error_occurs() throws Exception {
            String objectKey = "mindmaps/error-key";
            AwsCredentials credentials = mock(AwsCredentials.class);

            given(credentialsProvider.resolveCredentials()).willReturn(credentials);
            given(s3PostSigner.generatePostFields(eq(objectKey), any())).willThrow(
                    new RuntimeException("S3 Sign Error"));

            assertThatThrownBy(() -> s3SnapshotRepository.createPresignedUploadInfo(objectKey)).isInstanceOf(
                            CustomException.class).extracting(e -> ((CustomException) e).getErrorCode())
                    .isEqualTo(ErrorCode.S3_URL_FAIL);

            verify(credentialsProvider).resolveCredentials();
        }
    }
}