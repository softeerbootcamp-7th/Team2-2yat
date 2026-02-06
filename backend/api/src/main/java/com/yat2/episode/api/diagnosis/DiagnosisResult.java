package com.yat2.episode.api.diagnosis;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.yat2.episode.api.job.Job;
import com.yat2.episode.api.user.User;

@Getter
@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Table(name = "diagnosis_results")
public class DiagnosisResult {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;


    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "job_id", nullable = false)
    private Job job;

    @OneToMany(mappedBy = "diagnosisResult", fetch = FetchType.LAZY)
    private List<DiagnosisWeakness> weaknesses = new ArrayList<>();

    @Column(name = "created_at", insertable = false, updatable = false, nullable = false)
    private LocalDateTime createdAt;

    public DiagnosisResult(User user, Job job) {
        this.user = user;
        this.job = job;
    }
}
