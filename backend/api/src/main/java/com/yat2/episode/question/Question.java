package com.yat2.episode.question;

import com.yat2.episode.job.Job;
import com.yat2.episode.competency.CompetencyType;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

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