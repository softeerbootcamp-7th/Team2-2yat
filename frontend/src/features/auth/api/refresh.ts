import { AUTH_REFRESH_API } from "@/features/auth/api/api";
import { ApiError, toSafeApiError } from "@/features/auth/types/api.types";
import { ERROR_CODES, ERROR_META, isErrorCodeKey } from "@/shared/constants/error";

const API_BASE_URL = import.meta.env.VITE_API_BASE_URL;

let isRefreshing = false;
let refreshPromise: Promise<boolean> | null = null;

/**
 * 토큰 갱신 실패 에러
 *  해당 에러 발생 시 상위 컴포넌트에서 훅으로 로그인 페이지로 리다이렉트 처리
 */
export class TokenRefreshError extends Error {
    constructor(code: string = "TOKEN_EXPIRED") {
        super(isErrorCodeKey(code) ? ERROR_CODES[code] : ERROR_META.TOKEN_REFRESH_ERROR.defaultMessage);
        this.name = ERROR_META.TOKEN_REFRESH_ERROR.name;
        this.code = code;
    }
    code: string;
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
export async function refreshToken(): Promise<void | ApiError> {
    try {
        const response = await fetch(`${API_BASE_URL}${AUTH_REFRESH_API}`, {
            method: "POST",
            credentials: "include",
        });
        if (!response.ok) {
            const error: ApiError = await response.json();
            return toSafeApiError(error);
        }
        return;
    } catch (error) {
        return toSafeApiError(error);
    }
}
