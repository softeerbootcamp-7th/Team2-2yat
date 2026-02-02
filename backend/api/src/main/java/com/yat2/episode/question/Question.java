package com.yat2.episode.question;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import com.yat2.episode.competency.CompetencyType;
import com.yat2.episode.job.Job;

@Getter
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

    @Column(name = "content", nullable = false, length = 200)
    private String content;

    @Column(name = "guidance_message", nullable = false, length = 200)
    private String guidanceMessage;

    public Question(
            CompetencyType competencyType,
            Job job,
            String content,
            String guidanceMessage
    ) {
        this.competencyType = competencyType;
        this.content = content;
        this.guidanceMessage = guidanceMessage;
    }
}