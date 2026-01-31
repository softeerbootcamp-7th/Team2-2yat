package com.yat2.episode.question;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionRepository  extends JpaRepository<Question, Integer> {
    @Query("SELECT q FROM Question q JOIN FETCH q.competencyType")
    List<Question> findAllWithCompetency();

    @Query("SELECT q " +
            "FROM QuestionJobMapping qjm " +
            "JOIN qjm.question q " +
            "JOIN FETCH q.competencyType " +
            "WHERE qjm.job.id = :jobId")
    List<Question> findAllWithCompetencyByJobId(@Param("jobId") int jobId);
}
