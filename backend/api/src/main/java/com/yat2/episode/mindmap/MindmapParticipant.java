package com.yat2.episode.mindmap;

import com.yat2.episode.user.User;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Table(
        name = "mindmap_participant",
        uniqueConstraints = @UniqueConstraint(
                name = "uk_mindmap_participant_user_mindmap",
                columnNames = {"user_id", "mindmap_id"}
        )
)
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

    public void updateFavorite(boolean status) {
        this.isFavorite = status;
    }

    public MindmapParticipant(User user, Mindmap mindmap){
        this.user = user;
        this.mindmap = mindmap;
    }
}
