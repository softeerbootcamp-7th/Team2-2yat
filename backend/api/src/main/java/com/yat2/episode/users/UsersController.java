package com.yat2.episode.users;

import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.global.swagger.ApiErrorCodes;
import com.yat2.episode.global.swagger.AuthRequiredErrors;
import com.yat2.episode.users.dto.UserMeResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import static com.yat2.episode.global.constant.RequestAttrs.USER_ID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/users")
@Tag(name = "Users", description = "유저 관련 API")
public class UsersController {
    private final UsersService usersService;

    @GetMapping("/me")
    @Operation(
            summary = "내 정보 조회",
            description = "인증된 사용자의 userId, nickname, onboarded, guideSeen 정보를 반환합니다."
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "조회 성공",
                    content = @Content(schema = @Schema(implementation = UserMeResponse.class))
            ),
    })
    @AuthRequiredErrors
    @ApiErrorCodes({ErrorCode.USER_NOT_FOUND, ErrorCode.INTERNAL_ERROR})
    public UserMeResponse getMe(@RequestAttribute(USER_ID) long userId){
        return usersService.getMe(userId);
    }

    @PatchMapping("/me/job")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updateMyJob(
            @RequestAttribute(USER_ID) long userId,
            @RequestParam @NotNull @Positive Integer jobId
    ) {
        usersService.updateJob(userId, jobId);
    }
}