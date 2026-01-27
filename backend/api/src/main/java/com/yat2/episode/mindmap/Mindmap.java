package com.yat2.episode.mindmap;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Getter
@Setter
@Table(name = "mindmap")
public class Mindmap {

    @Id
    @Column(name = "id", columnDefinition = "BINARY(16)")
    private UUID id;

    @CreatedDate
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdTime;

    @LastModifiedDate
    @Column(name = "updated_time", nullable = false)
    private LocalDateTime updatedTime;

    @Column(name = "is_shared", nullable = false)
    private boolean shared;

    protected Mindmap() {
    }

    public Mindmap(UUID id, LocalDateTime createdTime, boolean shared) {
        this.id = id;
        this.createdTime = createdTime;
        this.shared = shared;
    }

}