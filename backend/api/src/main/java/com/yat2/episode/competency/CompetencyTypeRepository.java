package com.yat2.episode.competency;

import com.yat2.episode.users.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompetencyTypeRepository extends JpaRepository<CompetencyType, Integer> {
    @Query("""
    SELECT DISTINCT ct
    FROM Episode e
    JOIN e.competencyType ct
    WHERE e.mindmap.id = :mindmapId
""")
    List<CompetencyType> findByMindmapId(Long mindmapId);

}
