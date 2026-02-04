package com.yat2.episode.mindmap.s3;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import software.amazon.awssdk.auth.credentials.AwsCredentials;
import software.amazon.awssdk.auth.credentials.AwsSessionCredentials;

import java.nio.charset.StandardCharsets;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Base64;

import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.mindmap.s3.dto.S3UploadFieldsDto;
import com.yat2.episode.mindmap.s3.dto.S3UploadResponseDto;

@Component
@RequiredArgsConstructor
public class S3PostSigner {
    private static final String HMAC_ALGORITHM = "HmacSHA256";
    private final S3Properties s3Properties;

    public S3UploadResponseDto generatePostFields(String bucket, String key, String region, String endpoint,
                                                  AwsCredentials credentials) {

        String accessKey = credentials.accessKeyId().trim();
        String secretKey = credentials.secretAccessKey().trim();
        String sessionToken = (credentials instanceof AwsSessionCredentials) ?
                              ((AwsSessionCredentials) credentials).sessionToken().trim() : null;

        ZonedDateTime now = ZonedDateTime.now(ZoneId.of("UTC")).truncatedTo(ChronoUnit.SECONDS);
        String dateStamp = now.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        String xAmzDate = now.format(DateTimeFormatter.ofPattern("yyyyMMdd'T'HHmmss'Z'"));
        String expiration = now.plusMinutes(15).format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss'Z'"));

        String credential = accessKey + "/" + dateStamp + "/" + region + "/s3/aws4_request";
        String policyJson = buildPolicy(bucket, key, credential, xAmzDate, sessionToken, expiration);
        String policyBase64 = Base64.getEncoder().encodeToString(policyJson.getBytes(StandardCharsets.UTF_8));
        String signature = calculateSignature(policyBase64, secretKey, dateStamp, region);

        String actionUrl = (endpoint != null && !endpoint.isEmpty()) ? endpoint + "/" + bucket :
                           "https://" + bucket + ".s3." + region + ".amazonaws.com";

        return new S3UploadResponseDto(actionUrl, new S3UploadFieldsDto(key, "AWS4-HMAC-SHA256", credential, xAmzDate,
                                                                        sessionToken, policyBase64, signature));
    }

    private String buildPolicy(String bucket, String key, String credential, String xAmzDate, String sessionToken,
                               String expiration) {
        StringBuilder sb = new StringBuilder();
        sb.append("{");
        sb.append("\"expiration\":\"").append(expiration).append("\",");

        sb.append("\"conditions\":[");

        sb.append("{\"bucket\":\"").append(bucket).append("\"},");
        sb.append("{\"key\":\"").append(key).append("\"},");
        sb.append("{\"x-amz-algorithm\":\"AWS4-HMAC-SHA256\"},");
        sb.append("{\"x-amz-credential\":\"").append(credential).append("\"},");
        sb.append("{\"x-amz-date\":\"").append(xAmzDate).append("\"}");

        if (sessionToken != null && !sessionToken.trim().isEmpty()) {
            sb.append(",{\"x-amz-security-token\":\"").append(sessionToken.trim()).append("\"}");
        }

        sb.append(",[\"content-length-range\",0,").append(s3Properties.getMaxUploadSize()).append("]");

        sb.append("]}");
        return sb.toString();
    }

    private String calculateSignature(String stringToSign, String secret, String dateStamp, String region) {
        try {
            byte[] kSecret = ("AWS4" + secret).getBytes(StandardCharsets.UTF_8);
            byte[] kDate = hmac(kSecret, dateStamp);
            byte[] kRegion = hmac(kDate, region);
            byte[] kService = hmac(kRegion, "s3");
            byte[] kSigning = hmac(kService, "aws4_request");
            return toHex(hmac(kSigning, stringToSign));
        } catch (Exception e) {
            throw new CustomException(ErrorCode.S3_URL_FAIL);
        }
    }

    private byte[] hmac(byte[] key, String data) throws Exception {
        javax.crypto.Mac mac = javax.crypto.Mac.getInstance(HMAC_ALGORITHM);
        mac.init(new javax.crypto.spec.SecretKeySpec(key, HMAC_ALGORITHM));
        return mac.doFinal(data.getBytes(StandardCharsets.UTF_8));
    }

    private String toHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) sb.append(String.format("%02x", b));
        return sb.toString();
    }
}