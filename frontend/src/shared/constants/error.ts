export type ErrorCodeKey = keyof typeof ERROR_CODES;

export const ERROR_CODES = {
    // Mindmap
    MINDMAP_NOT_FOUND: "마인드맵을 찾을 수 없습니다.",
    INVALID_MINDMAP_UUID: "알맞지 않은 uuid 입니다.",
    MINDMAP_TITLE_REQUIRED: "팀 마인드맵 생성 시에는 title 입력이 필수 입니다.",
    S3_URL_FAIL: "스냅샷 업로드를 위한 URL 생성에 실패했습니다.",

    // Auth
    TOKEN_EXPIRED: "토큰이 만료되었습니다.",
    INVALID_TOKEN: "유효하지 않은 토큰입니다.",
    UNAUTHORIZED: "사용자 인증이 되지 않았습니다.",
    INVALID_TOKEN_SIGNATURE: "토큰 서명이 올바르지 않습니다.",
    INVALID_TOKEN_ISSUER: "토큰 발급자가 올바르지 않습니다.",
    INVALID_TOKEN_TYPE: "토큰 타입이 올바르지 않습니다.",
    INVALID_OAUTH_STATE: "OAuth state가 일치하지 않습니다.",
    OAUTH_ID_TOKEN_INVALID: "유효하지 않은 OAuth IDToken 입니다.",

    // Users
    USER_NOT_FOUND: "존재하지 않는 유저입니다.",

    // Common
    INVALID_REQUEST: "잘못된 요청입니다.",
    INTERNAL_ERROR: "서버 오류가 발생했습니다.",
    NOT_FOUND: "존재하지 않는 API 입니다.",
    METHOD_NOT_ALLOWED: "지원하지 않는 HTTP 메서드입니다.",

    // unknown
    UNKNOWN_ERROR: "알 수 없는 오류가 발생했습니다.",
} as const;

export const ERROR_META = {
    TOKEN_REFRESH_ERROR: {
        name: "TOKEN_REFRESH_ERROR",
        defaultMessage: "토큰 갱신에 실패했습니다.",
    },
} as const;

export const ERROR_CODE_KEYS = Object.entries(ERROR_CODES).reduce(
    (acc, [key]) => ({ ...acc, [key]: key }),
    {} as Record<ErrorCodeKey, ErrorCodeKey>,
);
