package com.yat2.episode.user.dto;

public record UserMeDto(
        long userId,
        String nickname,
        boolean onboarded,
        boolean guideSeen
) {}
