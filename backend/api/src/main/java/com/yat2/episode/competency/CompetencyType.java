package com.yat2.episode.competency;


import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity
@Table(name = "competency_type")
public class CompetencyType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "type_name", nullable = false, length = 50)
    private String typeName;

    @Enumerated(EnumType.STRING)
    @Column(
            name = "category",
            nullable = false,
            columnDefinition = "ENUM('협업_커뮤니케이션_역량','문제해결_사고_역량','실행_성장_역량')"
    )
    private Category category;

    public enum Category {
        협업_커뮤니케이션_역량,
        문제해결_사고_역량,
        실행_성장_역량
    }
}
