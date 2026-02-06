package com.yat2.episode.job;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

import com.yat2.episode.job.dto.JobsByOccupationDto;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.BDDMockito.given;

@ExtendWith(MockitoExtension.class)
class JobServiceTest {

    @Mock
    private JobRepository jobRepository;

    @InjectMocks
    private JobService jobService;

    @Test
    @DisplayName("직군이 비어있을 경우 빈 리스트를 반환한다")
    void getOccupationsWithJobs_Empty() {
        given(jobRepository.findAllWithOccupation()).willReturn(List.of());

        List<JobsByOccupationDto> result = jobService.getOccupationsWithJobs();

        assertThat(result).isEmpty();
    }

    @Test
    @DisplayName("서로 다른 직군의 직무들을 조회하면 직군별로 그룹화되어 반환된다")
    void getOccupationsWithJobs_GroupingSuccess() {
        Occupation occ1 = createOccupation(1, "개발");
        Occupation occ2 = createOccupation(2, "디자인");

        Job job1 = createJob(101, "백엔드", occ1);
        Job job2 = createJob(102, "프론트엔드", occ1);
        Job job3 = createJob(201, "UI/UX", occ2);

        given(jobRepository.findAllWithOccupation()).willReturn(List.of(job1, job2, job3));

        List<JobsByOccupationDto> result = jobService.getOccupationsWithJobs();

        assertThat(result).hasSize(2);

        assertThat(result.get(0).occupationName()).isEqualTo("개발");
        assertThat(result.get(0).jobs()).hasSize(2);
        assertThat(result.get(0).jobs().get(0).name()).isEqualTo("백엔드");

        assertThat(result.get(1).occupationName()).isEqualTo("디자인");
        assertThat(result.get(1).jobs()).hasSize(1);
        assertThat(result.get(1).jobs().get(0).name()).isEqualTo("UI/UX");
    }

    private Occupation createOccupation(Integer id, String name) {
        Occupation o = new Occupation();
        o.setId(id);
        o.setName(name);
        return o;
    }

    private Job createJob(Integer id, String name, Occupation occupation) {
        Job j = new Job();
        j.setId(id);
        j.setName(name);
        j.setOccupation(occupation);
        return j;
    }
}
