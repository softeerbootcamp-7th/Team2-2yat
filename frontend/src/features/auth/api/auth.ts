import { toSafeApiError, type ApiError, type LoginResponse } from "@/features/auth/types/api.types";
import { get, post } from "@/shared/api/method";

export const AUTH_API = "/api/auth";
export const AUTH_REFRESH_API = `${AUTH_API}/refresh`;
export const AUTH_LOGOUT_API = `${AUTH_API}/logout`;
export const AUTH_LOGIN_API = `${AUTH_API}/login`;

// 로그인
export const login = async (): Promise<LoginResponse | ApiError> => {
    try {
        return await get<LoginResponse>({ endpoint: AUTH_LOGIN_API });
    } catch (error) {
        return toSafeApiError(error);
    }
};

// 로그아웃
export const logout = async (): Promise<void | ApiError> => {
    try {
        await post<void, {}>({ endpoint: AUTH_LOGOUT_API });
    } catch (error) {
        return toSafeApiError(error);
    }
};
