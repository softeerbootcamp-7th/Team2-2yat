import { ERROR_CODES, ErrorCodeKey } from "@/shared/constants/error";

/**
 * API 에러 응답
 */
export type ApiError = {
    status: number;
    code: ErrorCodeKey;
    message: (typeof ERROR_CODES)[keyof typeof ERROR_CODES];
};
