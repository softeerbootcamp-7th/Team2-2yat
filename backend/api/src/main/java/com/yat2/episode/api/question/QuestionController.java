package com.yat2.episode.api.question;

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
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import com.yat2.episode.api.question.dto.QuestionsByCompetencyCategoryDto;

import static com.yat2.episode.api.global.constant.RequestAttrs.USER_ID;

@RequiredArgsConstructor
@RestController
@RequestMapping("/question")
@Tag(name = "Question", description = "역량 자가 진단용 문항 관련 API")
public class QuestionController {
    private final QuestionService questionService;

    @GetMapping()
    @Operation(summary = "세부 역량 별 문항 조회", description = "세부 역량 별 문항을 하나 씩 뽑아 목록으로 제공합니다.")
    @ApiResponses(
            { @ApiResponse(
                    responseCode = "200", description = "조회 성공", content = @Content(
                    array = @ArraySchema(schema = @Schema(implementation = QuestionsByCompetencyCategoryDto.class))
            )
            ), @ApiResponse(responseCode = "400", description = "직무 미션택", content = @Content), @ApiResponse(
                    responseCode = "401", description = "인증 " + "실패(토큰 없음/만료/유효하지 않음)", content = @Content
            ), @ApiResponse(responseCode = "404", description = "존재하지 않는 " + "사용자", content = @Content),
              @ApiResponse(responseCode = "500", description = "서버 오류", content = @Content) }
    )
    public ResponseEntity<List<QuestionsByCompetencyCategoryDto>> getQuestionSet(
            @RequestAttribute(USER_ID) long userId
    ) {

        return ResponseEntity.ok(questionService.getQuestionSetByUserId(userId));
    }
}
