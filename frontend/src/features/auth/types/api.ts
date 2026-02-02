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
