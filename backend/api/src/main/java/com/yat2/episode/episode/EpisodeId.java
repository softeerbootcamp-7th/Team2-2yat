package com.yat2.episode.episode;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Objects;

@Getter
@Setter
@Embeddable
public class EpisodeId implements Serializable {

    @Column(name = "node_id")
    private Integer nodeId;

    @Column(name = "user_id")
    private Long userId;

    public EpisodeId() {}

    public EpisodeId(Integer nodeId, Long userId) {
        this.nodeId = nodeId;
        this.userId = userId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof EpisodeId)) return false;
        EpisodeId that = (EpisodeId) o;
        return Objects.equals(nodeId, that.nodeId) &&
                Objects.equals(userId, that.userId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(nodeId, userId);
    }

}