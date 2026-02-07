package com.yat2.episode.job;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

import com.yat2.episode.job.dto.JobDto;
import com.yat2.episode.job.dto.JobsByOccupationDto;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.verify;

@ExtendWith(MockitoExtension.class)
@DisplayName("JobService 단위 테스트")
class JobServiceTest {

    @Mock
    private JobRepository jobRepository;

    @InjectMocks
    private JobService jobService;

    @Nested
    @DisplayName("getOccupationsWithJobs")
    class GetOccupationsWithJobsTest {

        @Test
        @DisplayName("직군 데이터가 비어있을 경우 빈 리스트를 반환한다")
        void should_return_empty_list_when_no_jobs_exist() {
            given(jobRepository.findAllWithOccupation()).willReturn(List.of());

            List<JobsByOccupationDto> result = jobService.getOccupationsWithJobs();

            assertThat(result).isEmpty();
            verify(jobRepository).findAllWithOccupation();
        }

        @Test
        @DisplayName("서로 다른 직군의 직무들을 조회하면 직군별로 그룹화하여 반환한다")
        void should_return_grouped_jobs_by_occupation() {
            Occupation occ1 = createOccupation(1, "개발");
            Occupation occ2 = createOccupation(2, "디자인");

            Job job1 = createJob(101, "백엔드", occ1);
            Job job2 = createJob(102, "프론트엔드", occ1);
            Job job3 = createJob(201, "UI/UX", occ2);

            given(jobRepository.findAllWithOccupation()).willReturn(List.of(job1, job2, job3));

            List<JobsByOccupationDto> result = jobService.getOccupationsWithJobs();

            assertThat(result).hasSize(2);

            JobsByOccupationDto firstGroup = result.get(0);
            assertThat(firstGroup.occupationId()).isEqualTo(1);
            assertThat(firstGroup.occupationName()).isEqualTo("개발");
            assertThat(firstGroup.jobs()).extracting(JobDto::name).containsExactly("백엔드", "프론트엔드");

            JobsByOccupationDto secondGroup = result.get(1);
            assertThat(secondGroup.occupationId()).isEqualTo(2);
            assertThat(secondGroup.occupationName()).isEqualTo("디자인");
            assertThat(secondGroup.jobs()).extracting(JobDto::name).containsExactly("UI/UX");

            verify(jobRepository).findAllWithOccupation();
        }
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