package com.yat2.episode.mindmap;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import com.yat2.episode.user.User;

@Entity
@Getter
@Table(name = "mindmap_participant", uniqueConstraints = @UniqueConstraint(name = "uk_mindmap_participant_user_mindmap",
        columnNames = { "user_id", "mindmap_id" }))
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class MindmapParticipant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mindmap_id", nullable = false)
    private Mindmap mindmap;

    @Column(name = "is_favorite", insertable = false)
    private boolean isFavorite;

    public MindmapParticipant(User user, Mindmap mindmap) {
        this.user = user;
        this.mindmap = mindmap;
    }

    public void updateFavorite(boolean status) {
        this.isFavorite = status;
    }
}
