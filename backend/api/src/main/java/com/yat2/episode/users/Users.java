package com.yat2.episode.users;

import com.yat2.episode.job.Job;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "users")
public class Users {

    @Id
    @Column(name = "kakao_id")
    private Long kakaoId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "job_id", nullable = false)
    private Job job;

    @Column(nullable = false, length = 45)
    private String nickname;

    @Column(name = "has_watched_feature_guide", nullable = false)
    private Boolean hasWatchedFeatureGuide;
}
