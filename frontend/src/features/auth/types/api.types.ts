import { User } from "@features/auth/types/user.types";

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
    onboardingCompleted: boolean | null;
    featureGuideCompleted: boolean | null;
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
 * 유틸리티: AuthCheckResponse를 User로 반환
 */
export function authCheckResponseToUser(response: AuthCheckResponse): User | null {
    if (!response.isAuthenticated) {
        return null;
    }
    return {
        userId: response.userId!,
        nickname: response.nickname!,
        onboardingCompleted: response.onboardingCompleted!,
        featureGuideCompleted: response.featureGuideCompleted!,
    };
}
