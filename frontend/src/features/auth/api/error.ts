import { ApiError } from "@/features/auth/types/api";
import { ERROR_CODES } from "@/shared/constants/error";

/**
 * ApiError 타입 가드
 */
export function isApiError(error: unknown): error is ApiError {
    if (error === null) {
        return false;
    }

    if (typeof error !== "object") {
        return false;
    }

    const hasRequiredFields = "status" in error && "code" in error && "message" in error;

    return hasRequiredFields;
}

/**
 * 다양한 에러를 안전하게 ApiError 타입으로 변환
 */
export function toSafeApiError(error: unknown): ApiError {
    if (isApiError(error)) {
        return error;
    }
    return {
        status: 500,
        code: "UNKNOWN_ERROR",
        message: error instanceof Error ? ERROR_CODES.UNKNOWN_ERROR : "알 수 없는 오류가 발생했습니다.",
    };
}
