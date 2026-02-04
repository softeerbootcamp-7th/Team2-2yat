import { AUTH_ENDPOINT } from "@/features/auth/api/api";
import { post } from "@/shared/api/method";

export const AUTH_REFRESH_ENDPOINT = `${AUTH_ENDPOINT}/refresh`;

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
        await post<void, Record<string, never>>({ endpoint: AUTH_REFRESH_ENDPOINT });
        return true;
    } catch {
        return false;
    }
}
