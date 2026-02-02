import { ApiError } from "@/features/auth/types/api";

/**
 * ApiError 타입 가드
 */
function isApiError(error: unknown): error is ApiError {
    return error !== null && typeof error === "object" && "status" in error && "code" in error && "message" in error;
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
        message: error instanceof Error ? error.message : "알 수 없는 오류가 발생했습니다.",
    };
}
