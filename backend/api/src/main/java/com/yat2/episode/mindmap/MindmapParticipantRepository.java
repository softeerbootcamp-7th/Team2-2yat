package com.yat2.episode.mindmap;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
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
    @Query("""
    DELETE FROM MindmapParticipant p
    WHERE p.mindmap.id = :uuid AND p.user.kakaoId = :userId
""")
    int deleteByMindmapIdAndUserId(@Param("uuid") UUID uuid, @Param("userId") Long userId);

    boolean existsByMindmap_Id(UUID mindmapId);

    @Query("""
                SELECT p
                FROM MindmapParticipant p
                JOIN p.mindmap m
                WHERE p.user.kakaoId = :userId
                  AND m.shared = :shared
                ORDER BY p.isFavorite DESC, m.updatedAt DESC
            """)
    List<MindmapParticipant> findByUserIdAndSharedOrderByFavoriteAndUpdatedDesc(
            @Param("userId") Long userId,
            @Param("shared") boolean shared
    );


    @Query("""
                SELECT p
                FROM MindmapParticipant p
                JOIN p.mindmap m
                WHERE p.user.kakaoId = :userId
                ORDER BY p.isFavorite DESC, m.updatedAt DESC
            """)
    List<MindmapParticipant> findByUserIdOrderByFavoriteAndUpdatedDesc(@Param("userId") Long userId);

    @Query("""
                SELECT p
                FROM MindmapParticipant p
                JOIN p.mindmap m
                WHERE m.id = :uuid and p.user.kakaoId = :userId
            """)
    Optional<MindmapParticipant> findByIdAndUserId(@Param("uuid") UUID uuid, @Param("userId") Long userId);
}
