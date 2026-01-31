package com.yat2.episode.global.swagger;

import com.yat2.episode.global.exception.ErrorCode;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@ApiErrorCodes({
        ErrorCode.UNAUTHORIZED,
        ErrorCode.TOKEN_EXPIRED,
        ErrorCode.INVALID_TOKEN,
        ErrorCode.INVALID_TOKEN_SIGNATURE,
        ErrorCode.INVALID_TOKEN_ISSUER,
        ErrorCode.INVALID_TOKEN_TYPE
})
public @interface AuthRequiredErrors {
}