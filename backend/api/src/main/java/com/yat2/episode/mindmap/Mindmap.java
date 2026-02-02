package com.yat2.episode.mindmap;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.UuidGenerator;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Table(name = "mindmap")
public class Mindmap {
    @Id
    @UuidGenerator(style = UuidGenerator.Style.VERSION_7)
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
        this.name = name;
        this.shared = shared;
    }
}