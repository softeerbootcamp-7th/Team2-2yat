package com.yat2.episode.job;

import jakarta.persistence.EntityManager;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.yat2.episode.utils.TestEntityFactory.createEntity;
import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Transactional
@ActiveProfiles("local")
@DisplayName("JobRepository 통합 테스트")
class JobRepositoryTest {

    @Autowired
    private JobRepository jobRepository;

    @Autowired
    private EntityManager em;

    @Test
    @DisplayName("모든 직무를 직군과 함께 페치 조인 및 정렬하여 조회한다")
    void findAllWithOccupation_Success() {
        Occupation occA = createEntity(Occupation.class);
        ReflectionTestUtils.setField(occA, "name", "A직군");
        em.persist(occA);

        Occupation occB = createEntity(Occupation.class);
        ReflectionTestUtils.setField(occB, "name", "B직군");
        em.persist(occB);

        Job job1 = createEntity(Job.class);
        ReflectionTestUtils.setField(job1, "name", "가직무");
        ReflectionTestUtils.setField(job1, "occupation", occA);

        Job job2 = createEntity(Job.class);
        ReflectionTestUtils.setField(job2, "name", "나직무");
        ReflectionTestUtils.setField(job2, "occupation", occA);

        Job job3 = createEntity(Job.class);
        ReflectionTestUtils.setField(job3, "name", "가직무");
        ReflectionTestUtils.setField(job3, "occupation", occB);

        jobRepository.saveAll(List.of(job1, job2, job3));

        em.flush();
        em.clear();

        List<Job> result = jobRepository.findAllWithOccupation();

        List<Job> filtered = result.stream()
                .filter(j -> List.of("A직군", "B직군").contains(j.getOccupation().getName()))
                .toList();

        assertThat(filtered).hasSize(3);

        assertThat(filtered.get(0).getOccupation().getName()).isEqualTo("A직군");
        assertThat(filtered.get(0).getName()).isEqualTo("가직무");

        assertThat(filtered.get(1).getOccupation().getName()).isEqualTo("A직군");
        assertThat(filtered.get(1).getName()).isEqualTo("나직무");

        assertThat(filtered.get(2).getOccupation().getName()).isEqualTo("B직군");
        assertThat(filtered.get(2).getName()).isEqualTo("가직무");
    }
}