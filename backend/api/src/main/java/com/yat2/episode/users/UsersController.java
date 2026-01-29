package com.yat2.episode.users;

import com.yat2.episode.users.dto.UserMeResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

import static com.yat2.episode.global.constant.RequestAttrs.USER_ID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/users")
public class UsersController {
    private final UsersService usersService;
    private final UsersRepository usersRepository;

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
            @ApiResponse(responseCode = "401", description = "인증 실패(토큰 없음/만료/유효하지 않음)", content = @Content),
            @ApiResponse(responseCode = "404", description = "존재하지 않는 사용자", content = @Content),
            @ApiResponse(responseCode = "500", description = "서버 오류", content = @Content)
    })
    public ResponseEntity<UserMeResponse> getMe(@RequestAttribute(USER_ID) long userId){
        return ResponseEntity.ok(usersService.getMe(userId));
    }

    @Operation(
            summary = "summary 예시",
            description = "사용자 리스트를 가져옵니다.",
            security = {
                    //@SecurityRequirement(name = "COOKIE_ACCESS_TOKEN")
            }
    )
    @GetMapping
    public ResponseEntity<List<Users>> getAllUsers() {
        return ResponseEntity.ok(usersService.getAllUsers());
    }
}