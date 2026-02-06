package com.yat2.episode.competency;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompetencyTypeRepository extends JpaRepository<CompetencyType, Integer> {
    @Query(
            value = "SELECT DISTINCT ct.* FROM episodes e " +
                    "JOIN competency_types ct ON e.competency_type_id = ct.id " +
                    "WHERE e.mindmap_id = UUID_TO_BIN(:mindmapId)", nativeQuery = true
    )
    List<CompetencyType> findByMindmapId(
            @Param("mindmapId") String mindmapId
    );


}
