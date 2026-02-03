package com.yat2.episode.job;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface JobRepository extends JpaRepository<Job, Integer> {

    @Query("""
            SELECT j
            FROM Job j
            JOIN FETCH j.occupation o
            ORDER BY o.name ASC, j.name ASC
            """)
    List<Job> findAllWithOccupation();
}
