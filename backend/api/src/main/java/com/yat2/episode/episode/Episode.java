package com.yat2.episode.episode;

import com.yat2.episode.competency.CompetencyType;
import jakarta.persistence.*;
import com.yat2.episode.mindmap.Mindmap;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;

import java.time.LocalDateTime;


@Getter
@Setter
@Entity
@Table(name = "episode")
public class Episode {

    @EmbeddedId
    private EpisodeId id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mindmap_id")
    private Mindmap mindmap;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "competency_type_id")
    private CompetencyType competencyType;

    private String situation;
    private String task;
    private String action;
    private String result;
    private String content;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;
}