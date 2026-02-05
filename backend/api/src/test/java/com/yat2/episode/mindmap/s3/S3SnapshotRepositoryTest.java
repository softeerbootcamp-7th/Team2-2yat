package com.yat2.episode.mindmap.s3;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;

import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.mindmap.s3.dto.S3UploadResponseDto;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.BDDMockito.given;

@ExtendWith(MockitoExtension.class) // Mockito 사용 설정
class S3SnapshotRepositoryTest {

    @Mock
    private S3PostSigner s3PostSigner;

    @Mock
    private AwsCredentialsProvider credentialsProvider;

    @InjectMocks
    private S3SnapshotRepository s3SnapshotRepository;

    @Test
    @DisplayName("ObjectKey가 주어지면 서명된 업로드 정보를 반환해야 한다")
    void createPresignedUploadInfo_Success() throws Exception {
        String objectKey = "mindmaps/test-key";
        AwsBasicCredentials credentials = AwsBasicCredentials.create("access", "secret");
        S3UploadResponseDto mockResponse = new S3UploadResponseDto("https://episode-s3.com", null);

        given(credentialsProvider.resolveCredentials()).willReturn(credentials);
        given(s3PostSigner.generatePostFields(eq(objectKey), any())).willReturn(mockResponse);

        S3UploadResponseDto result = s3SnapshotRepository.createPresignedUploadInfo(objectKey);

        assertThat(result.action()).isEqualTo("https://episode-s3.com");
    }

    @Test
    @DisplayName("서명 생성 중 예외 발생 시 CustomException(S3_URL_FAIL)을 던져야 한다")
    void createPresignedUploadInfo_ThrowException() throws Exception {
        given(credentialsProvider.resolveCredentials()).willThrow(new RuntimeException("AWS Connection Error"));

        assertThatThrownBy(() -> s3SnapshotRepository.createPresignedUploadInfo("any-key")).isInstanceOf(
                CustomException.class).hasFieldOrPropertyWithValue("errorCode", ErrorCode.S3_URL_FAIL);
    }
}
