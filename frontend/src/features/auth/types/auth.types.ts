import { User } from "@features/auth/types/user.types";

/**
 *  인증 상태 인터페이스
 *  AuthProvider에서 관리하는 전역 상태
 */
export type AuthState = {
    isAuthenticated: boolean;
    user: User | null;
    isLoading: boolean;
};

/**
 * AuthContext 값 타입
 */
export interface AuthContextValue extends AuthState {
    login: (user: User) => void;
    logout: () => Promise<void>;
    checkAuth: () => Promise<void>;
}
