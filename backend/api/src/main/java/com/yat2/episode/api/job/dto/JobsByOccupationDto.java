package com.yat2.episode.api.job.dto;

import java.util.List;

public record JobsByOccupationDto(
        Integer occupationId,
        String occupationName,
        List<JobDto> jobs
) {}
