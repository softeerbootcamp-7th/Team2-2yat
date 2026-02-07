package com.yat2.episode.mindmap;

import com.yat2.episode.user.User;
import com.yat2.episode.user.UserRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Transactional
@ActiveProfiles("local")
@DisplayName("MindmapRepository 통합 테스트")
class MindmapRepositoryTest {

    @Autowired
    private MindmapRepository mindmapRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MindmapParticipantRepository participantRepository;

    @Test
    @DisplayName("사용자 ID로 참여 중인 마인드맵 목록을 최신순으로 조회한다")
    void findByUserIdOrderByCreatedDesc_Success() {
        User user = User.newUser(12345L, "테스트유저");
        userRepository.save(user);

        Mindmap m1 = new Mindmap("먼저 만든 마인드맵", false);
        Mindmap m2 = new Mindmap("나중에 만든 마인드맵", false);
        mindmapRepository.save(m1);
        mindmapRepository.save(m2);

        participantRepository.save(new MindmapParticipant(user, m1));
        participantRepository.save(new MindmapParticipant(user, m2));

        List<Mindmap> result = mindmapRepository.findByUserIdOrderByCreatedDesc(12345L);

        assertThat(result).hasSize(2);
        assertThat(result.get(0).getName()).isEqualTo("나중에 만든 마인드맵");
    }

    @Test
    @DisplayName("특정 이름을 접두사로 가진 사용자의 마인드맵 이름들을 모두 조회한다")
    void findAllNamesByBaseName_Success() {
        User user = User.newUser(1L, "애플");
        userRepository.save(user);

        String baseName = "애플의 마인드맵";
        Mindmap m1 = new Mindmap(baseName, false);
        Mindmap m2 = new Mindmap(baseName + "(1)", false);

        mindmapRepository.saveAll(List.of(m1, m2));
        participantRepository.save(new MindmapParticipant(user, m1));
        participantRepository.save(new MindmapParticipant(user, m2));

        List<String> names = mindmapRepository.findAllNamesByBaseName(baseName, 1L);

        assertThat(names).hasSize(2);
        assertThat(names).containsExactlyInAnyOrder(baseName, baseName + "(1)");
    }

    @Test
    @DisplayName("비관적 잠금을 적용하여 마인드맵을 조회한다")
    void findByIdWithLock_Success() {
        Mindmap mindmap = new Mindmap("잠금 테스트", true);
        Mindmap saved = mindmapRepository.save(mindmap);
        UUID id = saved.getId();

        Optional<Mindmap> result = mindmapRepository.findByIdWithLock(id);

        assertThat(result).isPresent();
        assertThat(result.get().getName()).isEqualTo("잠금 테스트");
    }
}