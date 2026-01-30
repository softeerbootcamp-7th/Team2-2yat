import { AUTH_LOGIN_API, AUTH_LOGOUT_API } from "@/features/auth/api/api";
import { toSafeApiError, type ApiError, type LoginResponse } from "@/features/auth/types/api.types";
import { get, post } from "@/shared/api/method";

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
