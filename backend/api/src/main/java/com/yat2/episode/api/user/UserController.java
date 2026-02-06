package com.yat2.episode.api.user;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.yat2.episode.api.global.exception.ErrorCode;
import com.yat2.episode.api.global.swagger.ApiErrorCodes;
import com.yat2.episode.api.global.swagger.AuthRequiredErrors;
import com.yat2.episode.api.user.dto.UserMeDto;

import static com.yat2.episode.api.global.constant.RequestAttrs.USER_ID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/users")
@Tag(name = "Users", description = "유저 관련 API")
public class UserController {
    private final UserService userService;

    @GetMapping("/me")
    @Operation(summary = "내 정보 조회", description = "인증된 사용자의 userId, nickname, onboarded, guideSeen 정보를 반환합니다.")
    @ApiResponses(
            { @ApiResponse(
                    responseCode = "200", description = "조회 성공",
                    content = @Content(schema = @Schema(implementation = UserMeDto.class))
            ), }
    )
    @AuthRequiredErrors
    @ApiErrorCodes({ ErrorCode.USER_NOT_FOUND, ErrorCode.INTERNAL_ERROR })
    public UserMeDto getMe(
            @RequestAttribute(USER_ID) long userId
    ) {
        return userService.getMe(userId);
    }

    @Operation(summary = "내 직무 설정", description = "사용자의 직무를 변경합니다. jobId는 Query Parameter로 전달합니다.")
    @ApiResponses({ @ApiResponse(responseCode = "204", description = "성공") })
    @AuthRequiredErrors
    @ApiErrorCodes({ ErrorCode.INTERNAL_ERROR, ErrorCode.USER_NOT_FOUND, ErrorCode.JOB_NOT_FOUND })
    @PatchMapping("/me/job")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updateMyJob(
            @RequestAttribute(USER_ID) long userId,
            @RequestParam
            @NotNull
            @Positive
            Integer jobId
    ) {
        userService.updateJob(userId, jobId);
    }

    @Operation(summary = "기능 가이드 시청 완료", description = "사용자의 기능 가이드 시청 여부를 true로 설정합니다.")
    @ApiResponses({ @ApiResponse(responseCode = "204", description = "성공") })
    @AuthRequiredErrors
    @ApiErrorCodes({ ErrorCode.INTERNAL_ERROR, ErrorCode.USER_NOT_FOUND })
    @PatchMapping("/me/feature-guide")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void markFeatureGuideWatched(
            @RequestAttribute(USER_ID) long userId
    ) {
        userService.markFeatureGuideWatched(userId);
    }
}
