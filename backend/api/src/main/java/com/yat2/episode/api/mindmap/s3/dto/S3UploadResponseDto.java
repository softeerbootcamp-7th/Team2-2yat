package com.yat2.episode.api.mindmap.s3.dto;

public record S3UploadResponseDto(
        String action,
        S3UploadFieldsDto fields
) {}
