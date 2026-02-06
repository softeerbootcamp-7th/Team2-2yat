package com.yat2.episode.api.user;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import com.yat2.episode.api.job.Job;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Table(name = "users")
public class User {

    @Id
    @Column(name = "kakao_id")
    private Long kakaoId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "job_id")
    private Job job;


    @Column(nullable = false, length = 45)
    private String nickname;

    @Column(name = "has_watched_feature_guide", nullable = false)
    private Boolean hasWatchedFeatureGuide;

    public static User newUser(Long kakaoId, String nickname) {
        User u = new User();
        u.kakaoId = kakaoId;
        u.nickname = nickname;
        u.hasWatchedFeatureGuide = false;
        return u;
    }

    public void changeNickname(String nickname) {
        this.nickname = nickname;
    }

    public void updateJob(Job job) {
        this.job = job;
    }

    public void markFeatureGuideWatched() {
        this.hasWatchedFeatureGuide = true;
    }
}
