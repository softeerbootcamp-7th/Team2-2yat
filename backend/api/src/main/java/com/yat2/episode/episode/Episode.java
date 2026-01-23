package com.yat2.episode.episode;

import jakarta.persistence.*;
import com.yat2.episode.mindmap.Mindmap;
import lombok.Getter;
import lombok.Setter;


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

    private String situation;
    private String task;
    private String action;
    private String result;
    private String content;
}