package com.yat2.episode.job;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(
        name = "job",
        uniqueConstraints = @UniqueConstraint(
                name = "uk_job_occupation_name",
                columnNames = {"occupation_id", "name"}
        )
)
public class Job {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, length = 20)
    private String name;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "occupation_id", nullable = false)
    private Occupation occupation;
}
