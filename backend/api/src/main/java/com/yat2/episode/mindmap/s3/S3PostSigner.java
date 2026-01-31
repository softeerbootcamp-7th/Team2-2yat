package com.yat2.episode.mindmap.s3;

import org.springframework.stereotype.Component;
import software.amazon.awssdk.auth.credentials.AwsCredentials;
import software.amazon.awssdk.auth.credentials.AwsSessionCredentials;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.Map;

@Component
public class S3PostSigner {
    private static final String HMAC_ALGORITHM = "HmacSHA256";
    private static final long MAX_FILE_SIZE = 10 * 1024 * 1024; // 10MB

    public Map<String, String> generatePostFields(String bucket, String key, String region,
                                                  String endpoint, AwsCredentials credentials) {

        String accessKey = credentials.accessKeyId();
        String secretKey = credentials.secretAccessKey();
        String sessionToken = (credentials instanceof AwsSessionCredentials)
                ? ((AwsSessionCredentials) credentials).sessionToken() : null;

        ZonedDateTime now = ZonedDateTime.now();
        String dateStamp = now.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        String xAmzDate = now.format(DateTimeFormatter.ofPattern("yyyyMMdd'T'HHmmss'Z'"));
        String credential = accessKey + "/" + dateStamp + "/" + region + "/s3/aws4_request";

        // 1. 정책(Policy) 생성
        String policyJson = String.format(
                "{" +
                        "  \"expiration\": \"%s\"," +
                        "  \"conditions\": [" +
                        "    {\"bucket\": \"%s\"}," +
                        "    [\"starts-with\", \"$key\", \"%s\"]," +
                        "    {\"x-amz-algorithm\": \"AWS4-HMAC-SHA256\"}," +
                        "    {\"x-amz-credential\": \"%s\"}," +
                        "    {\"x-amz-date\": \"%s\"}," +
                        (sessionToken != null ? String.format("    {\"x-amz-security-token\": \"%s\"},", sessionToken) : "") + // ⭐️ 토큰 있으면 정책에도 추가
                        "    [\"content-length-range\", 0, %d]" +
                        "  ]" +
                        "}",
                now.plusMinutes(10).format(DateTimeFormatter.ISO_INSTANT),
                bucket,
                key,
                credential,
                xAmzDate,
                MAX_FILE_SIZE
        );

        String policyBase64 = Base64.getEncoder().encodeToString(policyJson.getBytes(StandardCharsets.UTF_8));
        String signature = calculateSignature(policyBase64, secretKey, dateStamp, region);

        Map<String, String> fields = new LinkedHashMap<>();

        String actionUrl = (endpoint != null && !endpoint.isEmpty())
                ? endpoint + "/" + bucket
                : "https://" + bucket + ".s3." + region + ".amazonaws.com";

        fields.put("action", actionUrl);
        fields.put("key", key);
        fields.put("x-amz-algorithm", "AWS4-HMAC-SHA256");
        fields.put("x-amz-credential", credential);
        fields.put("x-amz-date", xAmzDate);
        if (sessionToken != null) {
            fields.put("x-amz-security-token", sessionToken);
        }
        fields.put("policy", policyBase64);
        fields.put("x-amz-signature", signature);

        return fields;
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
            throw new RuntimeException("서명 생성 실패", e);
        }
    }

    private byte[] hmac(byte[] key, String data) throws Exception {
        Mac mac = Mac.getInstance(HMAC_ALGORITHM);
        mac.init(new SecretKeySpec(key, HMAC_ALGORITHM));
        return mac.doFinal(data.getBytes(StandardCharsets.UTF_8));
    }

    private String toHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) sb.append(String.format("%02x", b));
        return sb.toString();
    }
}