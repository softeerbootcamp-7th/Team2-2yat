package com.yat2.episode.global.swagger;

import com.yat2.episode.global.exception.ErrorResponse;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

import java.lang.annotation.*;

@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@ApiResponses({
        @ApiResponse(
                responseCode = "401",
                description = "인증 실패(토큰 없음/만료/유효하지 않음)",
                content = @Content(
                        schema = @Schema(implementation = ErrorResponse.class),
                        examples = {
                                @ExampleObject(
                                        name = "UNAUTHORIZED",
                                        value = "{\"status\":401,\"code\":\"UNAUTHORIZED\",\"message\":\"사용자 인증이 되지 않았습니다.\"}"
                                ),
                                @ExampleObject(
                                        name = "TOKEN_EXPIRED",
                                        value = "{\"status\":401,\"code\":\"TOKEN_EXPIRED\",\"message\":\"토큰이 만료되었습니다.\"}"
                                ),
                                @ExampleObject(
                                        name = "INVALID_TOKEN",
                                        value = "{\"status\":401,\"code\":\"INVALID_TOKEN\",\"message\":\"유효하지 않은 토큰입니다.\"}"
                                ),
                                @ExampleObject(
                                        name = "INVALID_TOKEN_SIGNATURE",
                                        value = "{\"status\":401,\"code\":\"INVALID_TOKEN_SIGNATURE\",\"message\":\"토큰 서명이 올바르지 않습니다.\"}"
                                ),
                                @ExampleObject(
                                        name = "INVALID_TOKEN_ISSUER",
                                        value = "{\"status\":401,\"code\":\"INVALID_TOKEN_ISSUER\",\"message\":\"토큰 발급자가 올바르지 않습니다.\"}"
                                ),
                                @ExampleObject(
                                        name = "INVALID_TOKEN_TYPE",
                                        value = "{\"status\":401,\"code\":\"INVALID_TOKEN_TYPE\",\"message\":\"토큰 타입이 올바르지 않습니다.\"}"
                                )
                        }
                )
        ),
        @ApiResponse(
                responseCode = "500",
                description = "서버 오류",
                content = @Content(
                        schema = @Schema(implementation = ErrorResponse.class),
                        examples = @ExampleObject(
                                name = "INTERNAL_ERROR",
                                value = "{\"status\":500,\"code\":\"INTERNAL_ERROR\",\"message\":\"서버 오류가 발생했습니다.\"}"
                        )
                )
        )
})
public @interface AuthRequiredErrorResponses {
}
