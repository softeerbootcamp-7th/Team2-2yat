package com.yat2.episode.question;

import com.yat2.episode.job.Job;
import com.yat2.episode.competency.CompetencyType;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Table(name = "question")
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "competency_type_id", nullable = false)
    private CompetencyType competencyType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "job_id")
    private Job job;

    @Column(name = "content", nullable = false, length = 200)
    private String content;

    public Question(
            CompetencyType competencyType,
            Job job,
            String content
    ) {
        this.competencyType = competencyType;
        this.job = job;
        this.content = content;
    }
}