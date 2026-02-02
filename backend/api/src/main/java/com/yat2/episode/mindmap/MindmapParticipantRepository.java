package com.yat2.episode.mindmap;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;
import java.util.UUID;

public interface MindmapParticipantRepository extends JpaRepository<MindmapParticipant, Integer> {
    @Query("""
                SELECT p
                FROM MindmapParticipant p
                WHERE p.mindmap.id = :uuid and p.user.kakaoId = :userId
            """)
    Optional<MindmapParticipant> findByMindmapIdAndUserId(@Param("uuid") UUID uuid, @Param("userId") Long userId);

    @Modifying
    int deleteByMindmap_IdAndUser_KakaoId(UUID uuid, Long userId);

    boolean existsByMindmap_Id(UUID mindmapId);
}
