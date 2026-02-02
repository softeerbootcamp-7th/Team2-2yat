import { AUTH_API } from "@/features/auth/api/api";
import { type ApiError, toSafeApiError } from "@/features/auth/types/api.types";
import { post } from "@/shared/api/method";

export const AUTH_LOGOUT_API = `${AUTH_API}/logout`;

// 로그아웃
export const logout = async (): Promise<void | ApiError> => {
    try {
        await post<void, Record<string, never>>({ endpoint: AUTH_LOGOUT_API });
    } catch (error) {
        return toSafeApiError(error);
    }
};
