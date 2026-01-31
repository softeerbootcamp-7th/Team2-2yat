package com.yat2.episode.job;

import com.yat2.episode.auth.security.Public;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.global.swagger.ApiErrorCodes;
import com.yat2.episode.job.dto.OccupationWithJobsResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@Public
@RestController
@RequiredArgsConstructor
@RequestMapping("/job")
@Tag(name = "Job", description = "직군/직무 조회 API")
public class JobController {
    private final JobService jobService;

    @GetMapping
    @Operation(
            summary = "직군/직무 전체 조회",
            description = "직군(occupation) 목록을 가나다순으로 조회하고, 각 직군에 속한 직무(job) 목록도 함께 반환합니다."
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "조회 성공",
                    content = @Content(array = @ArraySchema(schema = @Schema(implementation = OccupationWithJobsResponse.class)))
            )
    })
    @ApiErrorCodes(ErrorCode.INTERNAL_ERROR)
    public ResponseEntity<List<OccupationWithJobsResponse>> getOccupationsWithJobs() {
        return ResponseEntity.ok(jobService.getOccupationsWithJobs());
    }
}
