package com.yat2.episode.diagnosis;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DiagnosisWeaknessRepository extends JpaRepository<DiagnosisWeakness, Integer> {}

