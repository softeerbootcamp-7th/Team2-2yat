import { toSafeApiError } from "@/features/auth/api/error";
import { getRefreshState, refreshToken, setRefreshState } from "@/features/auth/api/refresh";
import { ApiError } from "@/features/auth/types/api";
import type { FetchOptions } from "@/shared/api/types";
import { ERROR_CODES } from "@/shared/constants/error";

const API_BASE_URL = import.meta.env.VITE_API_BASE_URL;

const TOKEN_REFRESH_ERROR: ApiError = {
    status: 401,
    code: "TOKEN_EXPIRED",
    message: ERROR_CODES.TOKEN_EXPIRED,
};

/**
 * 토큰 만료 시 자동 갱신 및 재시도하는 API 요청 래퍼
 * @throws {ApiError} 모든 에러를 ApiError 타입으로 변환하여 던집니다
 */
export async function fetchWithAuth<T>(endpoint: string, options: FetchOptions = {}): Promise<T> {
    try {
        const { skipRefresh = false, ...fetchOptions } = options;

        const url = `${API_BASE_URL}${endpoint}`;
        const config: RequestInit = {
            ...fetchOptions,
            credentials: "include",
            headers: {
                "Content-Type": "application/json",
                ...fetchOptions.headers,
            },
        };

        let response = await fetch(url, config);

        if (response.status === 401 && !skipRefresh) {
            const { isRefreshing, refreshPromise } = getRefreshState();

            if (isRefreshing && refreshPromise) {
                const refreshed = await refreshPromise;
                if (!refreshed) {
                    throw TOKEN_REFRESH_ERROR;
                }
            } else {
                const promise = refreshToken();
                setRefreshState(true, promise);

                try {
                    const refreshed = await promise;
                    if (!refreshed) {
                        throw TOKEN_REFRESH_ERROR;
                    }
                } finally {
                    setRefreshState(false, null);
                }
            }

            response = await fetch(url, config);
        }

        if (!response.ok) {
            const error: ApiError = await response.json().catch(() => ({
                status: response.status,
                code: "UNKNOWN_ERROR",
                message: `HTTP ${response.status}: ${response.statusText}`,
            }));
            throw error;
        }

        if (response.status === 204) {
            return {} as T;
        }

        return await response.json();
    } catch (error) {
        throw toSafeApiError(error);
    }
}
