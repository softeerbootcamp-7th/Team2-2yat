import { getRefreshState, refreshToken, setRefreshState, TokenRefreshError } from "@/features/auth/api/refresh";
import { ApiError } from "@/features/auth/types/api";
import type { FetchOptions } from "@/shared/api/types";

const API_BASE_URL = import.meta.env.VITE_API_BASE_URL;

/**
 * 토큰 만료 시 자동 갱신 및 재시도하는 API 요청 래퍼
 */
export async function fetchWithAuth<T>(endpoint: string, options: FetchOptions = {}): Promise<T> {
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
                throw new TokenRefreshError();
            }
        } else {
            const promise = refreshToken();
            setRefreshState(true, promise);

            try {
                const refreshed = await promise;
                if (!refreshed) {
                    throw new TokenRefreshError();
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
}
