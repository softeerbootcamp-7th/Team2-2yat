package com.yat2.episode.job.dto;

import java.util.List;

public record OccupationWithJobsResponse(
        Integer occupationId,
        String occupationName,
        List<JobDto> jobs
) {}