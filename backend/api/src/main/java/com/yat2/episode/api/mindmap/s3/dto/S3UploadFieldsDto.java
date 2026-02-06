package com.yat2.episode.api.mindmap.s3.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public record S3UploadFieldsDto(
        String key,

        @JsonProperty("x-amz-algorithm") String algorithm,

        @JsonProperty("x-amz-credential") String credential,

        @JsonProperty("x-amz-date") String date,

        @JsonProperty("x-amz-security-token") String securityToken,

        String policy,

        @JsonProperty("x-amz-signature") String signature
) {}
