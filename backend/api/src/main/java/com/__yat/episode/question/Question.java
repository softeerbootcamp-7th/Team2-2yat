package com.__yat.episode.question;

import com.__yat.episode.job.Job;
import com.__yat.episode.competency.CompetencyType;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "question")
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "competency_type_id", nullable = false)
    private CompetencyType competencyType;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "job_id", nullable = false)
    private Job job;

    @Column(name = "content", nullable = false, length = 200)
    private String content;

    @Column(name = "guidance_message", nullable = false, length = 200)
    private String guidanceMessage;

    protected Question() {
    }

    public Question(
            CompetencyType competencyType,
            Job job,
            String content,
            String guidanceMessage
    ) {
        this.competencyType = competencyType;
        this.job = job;
        this.content = content;
        this.guidanceMessage = guidanceMessage;
    }
}