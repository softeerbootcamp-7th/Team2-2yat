package com.yat2.episode.global.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public enum ErrorCode {
    //Mindmap
    MINDMAP_NOT_FOUND(HttpStatus.NOT_FOUND, "MINDMAP_NOT_FOUND", "마인드맵을 찾을 수 없습니다"),

    //Auth
    AUTH_EXPIRED(HttpStatus.UNAUTHORIZED, "AUTH_EXPIRED", "로그인이 만료되었습니다."),
    INVALID_TOKEN(HttpStatus.UNAUTHORIZED, "INVALID_TOKEN", "유효하지 않은 토큰입니다."),
    UNAUTHORIZED(HttpStatus.UNAUTHORIZED, "UNAUTHORIZED", "사용자 인증이 되지 않았습니다."),
    INVALID_TOKEN_SIGNATURE(HttpStatus.UNAUTHORIZED, "INVALID_TOKEN_SIGNATURE", "토큰 서명이 올바르지 않습니다."),
    INVALID_TOKEN_ISSUER(HttpStatus.UNAUTHORIZED, "INVALID_TOKEN_ISSUER", "토큰 발급자가 올바르지 않습니다."),
    INVALID_TOKEN_TYPE(HttpStatus.UNAUTHORIZED, "INVALID_TOKEN_TYPE", "토큰 타입이 올바르지 않습니다."),
    INVALID_OAUTH_STATE(HttpStatus.BAD_REQUEST, "INVALID_OAUTH_STATE", "OAuth state가 일치하지 않습니다."),
    OAUTH_ID_TOKEN_INVALID(HttpStatus.UNAUTHORIZED, "OAUTH_ID_TOKEN_INVALID", "유효하지 않은 OAuth IDToken 입니다."),

    //Common
    INVALID_REQUEST(HttpStatus.BAD_REQUEST, "INVALID_REQUEST", "잘못된 요청입니다."),
    INTERNAL_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "INTERNAL_ERROR", "서버 오류가 발생했습니다."),
    NOT_FOUND(HttpStatus.NOT_FOUND, "NOT_FOUND", "존재하지 않는 API 입니다."),
    METHOD_NOT_ALLOWED(HttpStatus.METHOD_NOT_ALLOWED, "METHOD_NOT_ALLOWED", "지원하지 않는 HTTP 메서드입니다.");

    private final HttpStatus httpStatus;
    private final String code;
    private final String message;

    ErrorCode(HttpStatus httpStatus, String code, String message) {
        this.httpStatus = httpStatus;
        this.code = code;
        this.message = message;
    }
}
