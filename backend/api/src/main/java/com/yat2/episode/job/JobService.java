package com.yat2.episode.job;

import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.yat2.episode.job.dto.JobDto;
import com.yat2.episode.job.dto.JobsByOccupationDto;

@Service
@RequiredArgsConstructor
public class JobService {

    private final JobRepository jobRepository;

    @Cacheable("occupationsWithJobs")
    @Transactional(readOnly = true)
    public List<JobsByOccupationDto> getOccupationsWithJobs() {
        List<Job> jobs = jobRepository.findAllWithOccupation();
        if (jobs.isEmpty()) return List.of();

        List<JobsByOccupationDto> res = new ArrayList<>();
        Integer curOccId = null;
        String curOccName = null;
        List<JobDto> curJobs = null;

        for (Job j : jobs) {
            Occupation o = j.getOccupation();

            if (!Objects.equals(curOccId, o.getId())) {
                if (curOccId != null) {
                    res.add(new JobsByOccupationDto(curOccId, curOccName, curJobs));
                }
                curOccId = o.getId();
                curOccName = o.getName();
                curJobs = new ArrayList<>();
            }

            curJobs.add(JobDto.of(j));
        }

        res.add(new JobsByOccupationDto(curOccId, curOccName, curJobs));
        return res;
    }
}
