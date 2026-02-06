package com.yat2.episode.api.mindmap.dto;

import io.swagger.v3.oas.annotations.media.Schema;

import com.yat2.episode.api.mindmap.s3.dto.S3UploadResponseDto;

public record MindmapCreatedWithUrlDto(
        MindmapDataExceptDateDto mindmap,
        @Schema(
                description = "S3 Presigned POST 업로드 정보 (form-data로 전송 필요)", example = """
                {
                    "action": "https://episode-bucket.s3.us-east-1.amazonaws.com",
                    "key": "maps/uuid-1234",
                    "x-amz-algorithm": "AWS4-HMAC-SHA256",
                    "x-amz-credential": "...",
                    "x-amz-date": "20260201T...",
                    "policy": "ey...",
                    "x-amz-signature": "a1b2..."
                }
                """
        ) S3UploadResponseDto uploadInfo
) {}
