import { AUTH_ENDPOINT } from "@/features/auth/api/api";
import { toSafeApiError } from "@/features/auth/api/error";
import { type ApiError } from "@/features/auth/types/api";
import { post } from "@/shared/api/method";

export const AUTH_LOGOUT_ENDPOINT = `${AUTH_ENDPOINT}/logout`;

// 로그아웃
export const logout = async (): Promise<void | ApiError> => {
    try {
        await post<void, Record<string, never>>({ endpoint: AUTH_LOGOUT_ENDPOINT });
    } catch (error) {
        return toSafeApiError(error);
    }
};
