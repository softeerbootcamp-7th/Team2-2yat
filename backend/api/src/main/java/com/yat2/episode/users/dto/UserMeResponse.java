package com.yat2.episode.users.dto;

public record UserMeResponse(
        Long userId,
        String nickname,
        boolean onboarded,
        boolean guideSeen
) {}