package com.yat2.episode.episode;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

import com.yat2.episode.competency.CompetencyType;
import com.yat2.episode.mindmap.Mindmap;
import com.yat2.episode.user.User;

@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity
@Table(name = "episodes")
public class Episode {

    @EmbeddedId
    private EpisodeId id;

    @MapsId("userId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "mindmap_id", nullable = false)
    private Mindmap mindmap;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "competency_type_id")
    private CompetencyType competencyType;

    @Column(length = 200)
    private String situation;

    @Column(length = 200)
    private String task;

    @Column(length = 200)
    private String action;

    @Column(length = 200)
    private String result;

    @Column(length = 100)
    private String content;

    @Column(name = "created_at", nullable = false, insertable = false, updatable = false)
    private LocalDateTime createdAt;

    public static Episode create(long userId, int nodeId, Mindmap mindmap) {
        Episode e = new Episode();
        e.id = new EpisodeId(nodeId, userId);
        e.mindmap = mindmap;
        return e;
    }
}
