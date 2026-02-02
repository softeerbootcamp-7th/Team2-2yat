package com.yat2.episode.user.dto;

public record UserMeResponse(
        Long userId,
        String nickname,
        boolean onboarded,
        boolean guideSeen
) {}