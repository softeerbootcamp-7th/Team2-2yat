package com.yat2.episode.question;


import com.yat2.episode.job.Job;
import com.yat2.episode.mindmap.Mindmap;
import com.yat2.episode.users.Users;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Table(name = "question_job_mapping")
public class QuestionJobMapping {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "question_id", nullable = false)
    private Question question;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "job_id", nullable = false)
    private Job job;

    public QuestionJobMapping(Job job, Question question){
        this.question = question;
        this.job = job;
    }
}
