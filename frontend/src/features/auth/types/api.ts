import { User } from "@/features/auth/types/user";

/**
 * 카카오 로그인 API
 */
export type LoginRequest = {
    code: string;
};

export type LoginResponse = {
    user: User;
};

/**
 * 인증 상태 확인 API
 */
export type AuthCheckResponse = {
    isAuthenticated: boolean;
    userId: number | null;
    nickname: string | null;
    onboarded: boolean | null;
    guideSeen: boolean | null;
};

/**
 * API 에러 응답
 */
export type ApiError = {
    status: number;
    code: string;
    message: string;
};

/**
 * 다양한 에러를 안전하게 ApiError 타입으로 변환
 */
export function toSafeApiError(error: unknown): ApiError {
    if (error && typeof error === "object" && "status" in error && "code" in error && "message" in error) {
        return error as ApiError;
    }
    return {
        status: 500,
        code: "UNKNOWN_ERROR",
        message: error instanceof Error ? error.message : "알 수 없는 오류가 발생했습니다.",
    };
}
