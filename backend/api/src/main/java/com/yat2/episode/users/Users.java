package com.yat2.episode.users;

import com.yat2.episode.job.Job;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Table(name = "users")
public class Users {

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

    public static Users newUser(Long kakaoId, String nickname) {
        Users u = new Users();
        u.kakaoId = kakaoId;
        u.nickname = nickname;
        u.hasWatchedFeatureGuide = false;
        return u;
    }

    public void changeNickname(String nickname) {
        this.nickname = nickname;
    }
}
