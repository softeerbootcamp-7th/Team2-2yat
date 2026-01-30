const API_BASE_URL = import.meta.env.VITE_API_BASE_URL;

let isRefreshing = false;
let refreshPromise: Promise<boolean> | null = null;

/**
 * 토큰 갱신 실패 에러
 *  해당 에러 발생 시 상위 컴포넌트에서 훅으로 로그인 페이지로 리다이렉트 처리
 */
export class TokenRefreshError extends Error {
    constructor(message = "토큰 갱신에 실패했습니다") {
        super(message);
        this.name = "TOKEN_REFRESH_ERROR";
    }
}

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
        const response = await fetch(`${API_BASE_URL}/auth/refresh`, {
            method: "POST",
            credentials: "include",
        });

        if (response.status === 401) {
            throw new TokenRefreshError();
        }

        return response.ok;
    } catch (error) {
        if (error instanceof TokenRefreshError) throw error;
        return false;
    }
}
