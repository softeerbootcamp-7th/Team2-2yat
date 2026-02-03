package com.yat2.episode.mindmap;

import com.github.f4b6a3.uuid.UuidCreator;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Table(name = "mindmap")
public class Mindmap {
    @Id
    @Column(name = "id", columnDefinition = "BINARY(16)")
    private UUID id;

    @Column(name = "created_at", insertable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at", insertable = false)
    private LocalDateTime updatedAt;

    @Column(name = "name", nullable = false, length = 43)
    private String name;

    @Column(name = "is_shared", nullable = false)
    private boolean shared;

    public Mindmap(String name, boolean shared) {
        this.id = UuidCreator.getTimeOrderedEpoch();
        this.name = name;
        this.shared = shared;
    }

    public Mindmap(UUID id, String name, boolean shared) {
        this.id = id;
        this.name = name;
        this.shared = shared;
    }

    public void updateName(String name) {
        this.name = name;
    }
}
