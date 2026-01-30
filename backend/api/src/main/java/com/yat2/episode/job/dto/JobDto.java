package com.yat2.episode.job.dto;

import com.yat2.episode.job.Job;

public record JobDto(
        Integer id,
        String name
) {
    public static JobDto of(Job job) {
        return new JobDto(job.getId(), job.getName());
    }
}