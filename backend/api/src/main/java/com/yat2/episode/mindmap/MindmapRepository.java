package com.yat2.episode.mindmap;

import jakarta.persistence.LockModeType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface MindmapRepository extends JpaRepository<Mindmap, UUID> {

    @Query("""
                SELECT m
                FROM MindmapParticipant p
                JOIN p.mindmap m
                WHERE p.user.kakaoId = :userId
                ORDER BY m.createdAt DESC
            """)
    List<Mindmap> findByUserIdOrderByCreatedDesc(@Param("userId") Long userId);

    @Query("""
                SELECT m.name
                FROM MindmapParticipant p
                JOIN p.mindmap m
                WHERE m.name LIKE CONCAT(:name, '%')
                  AND p.user.kakaoId = :userId
            """)
    List<String> findAllNamesByBaseName(@Param("name") String name, @Param("userId") Long userId);


    @Lock(LockModeType.PESSIMISTIC_WRITE)
    @Query("select m from Mindmap m where m.id = :id")
    public Optional<Mindmap> findByIdWithLock(@Param("id") UUID id);

}
