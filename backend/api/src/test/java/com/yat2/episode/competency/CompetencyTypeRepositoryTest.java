package com.yat2.episode.competency;

import com.yat2.episode.episode.Episode;
import com.yat2.episode.episode.EpisodeId;
import com.yat2.episode.mindmap.Mindmap;
import com.yat2.episode.user.User;
import jakarta.persistence.EntityManager;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

import static com.yat2.episode.utils.TestEntityFactory.createEntity;
import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Transactional
@ActiveProfiles("local")
@DisplayName("CompetencyTypeRepository 통합 테스트")
class CompetencyTypeRepositoryTest {

    @Autowired
    private CompetencyTypeRepository competencyTypeRepository;

    @Autowired
    private EntityManager em;

    @Test
    @DisplayName("마인드맵 ID로 해당 마인드맵에 포함된 모든 역량 타입을 중복 없이 조회한다")
    void findByMindmapId_Success() {
        Mindmap mindmap = createEntity(Mindmap.class);
        UUID mindmapId = UUID.randomUUID();
        ReflectionTestUtils.setField(mindmap, "id", mindmapId);
        ReflectionTestUtils.setField(mindmap, "name", "테스트 마인드맵");
        em.persist(mindmap);

        User user = createEntity(User.class);
        ReflectionTestUtils.setField(user, "kakaoId", 12345L);
        ReflectionTestUtils.setField(user, "nickname", "테스터");
        ReflectionTestUtils.setField(user, "hasWatchedFeatureGuide", false);
        em.persist(user);

        CompetencyType ct1 = createEntity(CompetencyType.class);
        ReflectionTestUtils.setField(ct1, "typeName", "소통역량");
        ReflectionTestUtils.setField(ct1, "category", CompetencyType.Category.협업_커뮤니케이션_역량);
        competencyTypeRepository.save(ct1);

        CompetencyType ct2 = createEntity(CompetencyType.class);
        ReflectionTestUtils.setField(ct2, "typeName", "문제해결");
        ReflectionTestUtils.setField(ct2, "category", CompetencyType.Category.문제해결_사고_역량);
        competencyTypeRepository.save(ct2);

        persistEpisode(user, mindmap, ct1, 1);
        persistEpisode(user, mindmap, ct1, 2);
        persistEpisode(user, mindmap, ct2, 3);

        em.flush();
        em.clear();

        List<CompetencyType> result = competencyTypeRepository.findByMindmapId(mindmapId.toString());

        assertThat(result).hasSize(2);
        assertThat(result).extracting("typeName")
                .containsExactlyInAnyOrder("소통역량", "문제해결");
    }

    private void persistEpisode(User user, Mindmap mindmap, CompetencyType ct, int nodeId) {
        EpisodeId id = createEntity(EpisodeId.class);
        ReflectionTestUtils.setField(id, "nodeId", nodeId);
        ReflectionTestUtils.setField(id, "userId", user.getKakaoId());

        Episode episode = createEntity(Episode.class);
        ReflectionTestUtils.setField(episode, "id", id);
        ReflectionTestUtils.setField(episode, "user", user);
        ReflectionTestUtils.setField(episode, "mindmap", mindmap);
        ReflectionTestUtils.setField(episode, "competencyType", ct);

        ReflectionTestUtils.setField(episode, "content", "테스트 내용 " + nodeId);

        em.persist(episode);
    }
}