import { ApiError } from "@features/auth/types/api.types";
import { getRefreshState, refreshToken, setRefreshState } from "@shared/api/refresh";

import type { FetchOptions } from "./types";

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

    try {
        let response = await fetch(url, config);

        if (response.status === 401 && !skipRefresh) {
            const { isRefreshing, refreshPromise } = getRefreshState();

            if (isRefreshing && refreshPromise) {
                const refreshed = await refreshPromise;
                if (!refreshed) {
                    throw new Error("TOKEN_REFRESH_FAILED");
                }
            } else {
                const promise = refreshToken();
                setRefreshState(true, promise);

                const refreshed = await promise;
                setRefreshState(false, null);

                if (!refreshed) {
                    throw new Error("TOKEN_REFRESH_FAILED");
                }
            }

            response = await fetch(url, config);
        }

        if (!response.ok) {
            const error: ApiError = await response.json().catch(() => ({
                error: "Unknown error",
                message: `HTTP ${response.status}`,
            }));
            throw new Error(error.message || `HTTP ${response.status}`);
        }

        if (response.status === 204) {
            return {} as T;
        }

        return await response.json();
    } catch (error) {
        throw error;
    }
}
