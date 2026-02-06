package com.yat2.episode.api.user.dto;

public record UserMeDto(
        long userId,
        String nickname,
        boolean onboarded,
        boolean guideSeen
) {}
