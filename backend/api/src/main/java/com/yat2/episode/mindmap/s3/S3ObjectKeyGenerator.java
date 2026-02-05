package com.yat2.episode.mindmap.s3;

import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class S3ObjectKeyGenerator {
    public String generateMindmapSnapshotKey(UUID mindmapId) {
        return String.format("mindmaps/%s", mindmapId);
    }

    public String generatePendingUploadKey(UUID userId, String fileName) {
        return String.format("temp/%s/%s", userId, fileName);
    }
}
