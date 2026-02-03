package com.yat2.episode.diagnosis;


import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.URI;

import com.yat2.episode.diagnosis.dto.DiagnosisSimpleDto;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.global.swagger.ApiErrorCodes;
import com.yat2.episode.global.swagger.AuthRequiredErrors;
import com.yat2.episode.mindmap.dto.MindmapArgsReqDto;

import static com.yat2.episode.global.constant.RequestAttrs.USER_ID;

@RequiredArgsConstructor
@RestController
@RequestMapping("/diagnosis")
@Tag(name = "Diagnosis", description = "마인드맵 관리 API")
public class DiagnosisResultController {
    private final DiagnosisResultService diagnosisResultService;

    @Operation(summary = "진단 저장", description = """
            답변하지 못한 데이터를 기반으로 진단을 저장합니다.
            """)
    @ApiResponses({ @ApiResponse(responseCode = "201", description = "저장 성공") })
    @AuthRequiredErrors
    @ApiErrorCodes({ ErrorCode.USER_NOT_FOUND, ErrorCode.INTERNAL_ERROR, })
    @PostMapping()
    public ResponseEntity<DiagnosisSimpleDto> createMindmap(@RequestAttribute(USER_ID) long userId,
                                                            @RequestBody MindmapArgsReqDto reqBody) {
        DiagnosisSimpleDto resBody = null;//diagnosisResultService.createDiagnosis(userId, reqBody);
        URI location = null;//diagnosisResultService.getCreatedURI(resBody.mindmap().mindmapId());
        return ResponseEntity.created(location).body(resBody);
    }
}
