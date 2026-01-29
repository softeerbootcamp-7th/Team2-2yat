const API_BASE_URL = import.meta.env.VITE_API_BASE_URL;

let isRefreshing = false;
let refreshPromise: Promise<boolean> | null = null;

/**
 * 토큰 갱신 상태 확인
 */
export function getRefreshState() {
    return { isRefreshing, refreshPromise };
}

/**
 * 토큰 갱신 상태 설정
 */
export function setRefreshState(refreshing: boolean, promise: Promise<boolean> | null) {
    isRefreshing = refreshing;
    refreshPromise = promise;
}

/**
 * 토큰 갱신 함수
 */
export async function refreshToken(): Promise<boolean> {
    try {
        const response = await fetch(`${API_BASE_URL}/api/auth/refresh`, {
            method: "POST",
            credentials: "include",
        });

        if (response.ok) {
            return true;
        }

        return false;
    } catch (error) {
        return false;
    }
}
