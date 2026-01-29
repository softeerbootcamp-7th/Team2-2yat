import type { FetchOptions } from "@shared/api/types";
import { fetchWithAuth } from "@shared/api/client";

/**
 * GET 요청
 */
export function get<T>(endpoint: string, options?: FetchOptions): Promise<T> {
    return fetchWithAuth<T>(endpoint, { ...options, method: "GET" });
}

/**
 * POST 요청
 */
export function post<T>(endpoint: string, data?: unknown, options?: FetchOptions): Promise<T> {
    return fetchWithAuth<T>(endpoint, {
        ...options,
        method: "POST",
        body: data ? JSON.stringify(data) : undefined,
    });
}

/**
 * PUT 요청
 */
export function put<T>(endpoint: string, data?: unknown, options?: FetchOptions): Promise<T> {
    return fetchWithAuth<T>(endpoint, {
        ...options,
        method: "PUT",
        body: data ? JSON.stringify(data) : undefined,
    });
}

/**
 * DELETE 요청
 */
export function del<T>(endpoint: string, options?: FetchOptions): Promise<T> {
    return fetchWithAuth<T>(endpoint, { ...options, method: "DELETE" });
}
