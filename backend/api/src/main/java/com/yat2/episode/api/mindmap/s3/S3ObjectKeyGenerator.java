package com.yat2.episode.api.mindmap.s3;

import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class S3ObjectKeyGenerator {
    public String generateMindmapSnapshotKey(UUID mindmapId) {
        return String.format("mindmaps/%s", mindmapId);
    }

    //todo: validate를 위한 objectKey 생성 함수 필요
}
