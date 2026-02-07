package com.yat2.episode.mindmap.s3;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;

@DisplayName("S3ObjectKeyGenerator 단위 테스트")
class S3ObjectKeyGeneratorTest {

    private final S3ObjectKeyGenerator keyGenerator = new S3ObjectKeyGenerator();

    @Test
    @DisplayName("마인드맵 ID를 기반으로 스냅샷 키를 생성한다")
    void generateMindmapSnapshotKey_Success() {
        UUID mindmapId = UUID.randomUUID();

        String key = keyGenerator.generateMindmapSnapshotKey(mindmapId);

        assertThat(key).isEqualTo("mindmaps/" + mindmapId);
    }
}