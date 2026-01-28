package com.yat2.episode.mindmap;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface MindmapRepository extends JpaRepository<Mindmap, UUID> {
    @Query("""
                SELECT m
                FROM MindmapParticipant p
                JOIN p.mindmap m
                WHERE p.user.kakaoId = :userId
                ORDER BY m.isFavorite DESC, m.updatedAt DESC
            """)
    List<Mindmap> findMindmapsByUserId(@Param("userId") Long userId);

}
