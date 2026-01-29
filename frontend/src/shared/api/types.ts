/**
 * API 요청 공통 타입
 * fetchWithAuth와 관련된 옵션 및 타입 정의
 *  401 에러 시 자동 토큰 갱신
 */
export type FetchOptions = RequestInit & {
    skipRefresh?: boolean;
};
