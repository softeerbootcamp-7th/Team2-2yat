package com.yat2.episode.api.competency;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity
@Table(name = "competency_types")
public class CompetencyType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "type_name", nullable = false, length = 50)
    private String typeName;

    @Enumerated(EnumType.STRING)
    @Column(name = "category", nullable = false, columnDefinition = "ENUM('협업_커뮤니케이션_역량','문제해결_사고_역량','실행_성장_역량')")
    private Category category;

    public enum Category {
        협업_커뮤니케이션_역량, 문제해결_사고_역량, 실행_성장_역량
    }
}
