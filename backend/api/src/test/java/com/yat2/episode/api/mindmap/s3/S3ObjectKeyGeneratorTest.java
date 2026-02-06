package com.yat2.episode.api.mindmap.s3;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.UUID;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

class S3ObjectKeyGeneratorTest {
    private final S3ObjectKeyGenerator generator = new S3ObjectKeyGenerator();

    @Test
    @DisplayName("마인드맵 스냅샷 키 생성 확인")
    void generateMindmapSnapshotKey_Success() {
        UUID mindmapId = UUID.randomUUID();

        String key = generator.generateMindmapSnapshotKey(mindmapId);

        assertThat(key).isEqualTo("mindmaps/" + mindmapId);
    }
}
