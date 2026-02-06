package com.yat2.episode.diagnosis;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.constraints.Positive;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.URI;
import java.util.List;

import com.yat2.episode.diagnosis.dto.DiagnosisArgsReqDto;
import com.yat2.episode.diagnosis.dto.DiagnosisDetailDto;
import com.yat2.episode.diagnosis.dto.DiagnosisSummaryDto;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.global.swagger.ApiErrorCodes;
import com.yat2.episode.global.swagger.AuthRequiredErrors;
import com.yat2.episode.global.utils.UriUtil;

import static com.yat2.episode.global.constant.RequestAttrs.USER_ID;

@RestController
@AuthRequiredErrors
@RequiredArgsConstructor
@Validated
@RequestMapping("/diagnosis")
@Tag(name = "Diagnosis", description = "역량 진단 관리 API")
public class DiagnosisController {
    private final DiagnosisService diagnosisService;

    @Operation(summary = "나의 진단 리스트 조회")
    @ApiResponses({ @ApiResponse(responseCode = "200", description = "조회 성공") })
    @ApiErrorCodes(ErrorCode.INTERNAL_ERROR)
    @GetMapping()
    public List<DiagnosisSummaryDto> getDiagnosisSummaries(
            @RequestAttribute(USER_ID) Long userId
    ) {
        return diagnosisService.getDiagnosisSummariesByUserId(userId);
    }

    @Operation(summary = "진단 결과 상세 조회")
    @ApiResponses({ @ApiResponse(responseCode = "200", description = "조회 성공") })
    @ApiErrorCodes({ ErrorCode.INTERNAL_ERROR, ErrorCode.INVALID_REQUEST })
    @GetMapping("/{diagnosisId}")
    public DiagnosisDetailDto getDiagnosisDetailById(
            @PathVariable
            @Positive(message = "Id는 1 이상의 정수여야 합니다.")
            Integer diagnosisId,
            @RequestAttribute(USER_ID) Long userId
    ) {
        return diagnosisService.getDiagnosisDetailById(diagnosisId, userId);
    }

    @Operation(
            summary = "진단 저장", description = """
            답변하지 못한 데이터를 기반으로 진단을 저장합니다.
            """
    )
    @ApiResponses({ @ApiResponse(responseCode = "201", description = "저장 성공") })
    @ApiErrorCodes(
            { ErrorCode.USER_NOT_FOUND, ErrorCode.INTERNAL_ERROR, ErrorCode.QUESTION_NOT_FOUND,
              ErrorCode.JOB_NOT_SELECTED }
    )
    @PostMapping()
    public ResponseEntity<DiagnosisSummaryDto> createDiagnosis(
            @RequestAttribute(USER_ID) long userId,
            @RequestBody DiagnosisArgsReqDto reqBody
    ) {
        DiagnosisSummaryDto resBody = diagnosisService.createDiagnosis(userId, reqBody);
        URI location = UriUtil.createLocationUri(resBody.diagnosisId());
        return ResponseEntity.created(location).body(resBody);
    }
}
