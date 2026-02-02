import { AUTH_ENDPOINT } from "@/features/auth/api/api";
import { post } from "@/shared/api/method";
import { ERROR_CODE_KEYS, ERROR_CODES, ERROR_META, ErrorCodeKey } from "@/shared/constants/error";

export const AUTH_REFRESH_ENDPOINT = `${AUTH_ENDPOINT}/refresh`;

let isRefreshing = false;
let refreshPromise: Promise<boolean> | null = null;

/**
 * 토큰 갱신 실패 에러
 *  해당 에러 발생 시 상위 컴포넌트에서 훅으로 로그인 페이지로 리다이렉트 처리
 */
export class TokenRefreshError extends Error {
    code: ErrorCodeKey;

    constructor(code: ErrorCodeKey = ERROR_CODE_KEYS.TOKEN_EXPIRED) {
        const message = ERROR_CODES[code];

        super(message);
        this.name = ERROR_META.TOKEN_REFRESH_ERROR.name;
        this.code = code;
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
        await post<void, Record<string, never>>({ endpoint: AUTH_REFRESH_ENDPOINT });
        return true;
    } catch {
        return false;
    }
}
