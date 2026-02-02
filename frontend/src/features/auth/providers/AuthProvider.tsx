import { useCallback, useEffect, useState } from "react";

import { logout as logoutApi } from "@/features/auth/api/auth";
import { AuthContext } from "@/features/auth/contexts/AuthContext";
import type { User } from "@/features/auth/types/user";
import { get } from "@/shared/api/method";

const USER_API = "/users";
const USER_ME_API = `${USER_API}/me`;

type AuthProviderProps = {
    children: React.ReactNode;
};

export function AuthProvider({ children }: AuthProviderProps) {
    const [isAuthenticated, setIsAuthenticated] = useState(false);
    const [user, setUser] = useState<User | null>(null);
    const [isLoading, setIsLoading] = useState(true);

    const login = async (user: User) => {
        setUser(user);
        setIsAuthenticated(true);
    };

    const logout = async () => {
        try {
            await logoutApi();
        } finally {
            setUser(null);
            setIsAuthenticated(false);
        }
    };

    // checkAuth: 내 정보 API 호출로 인증 상태 확인
    const checkAuth = useCallback(async () => {
        setIsLoading(true);
        try {
            const me = await get<User>({ endpoint: USER_ME_API });
            setUser(me);
            setIsAuthenticated(true);
        } catch {
            setUser(null);
            setIsAuthenticated(false);
        } finally {
            setIsLoading(false);
        }
    }, []);

    // 마운트 시 자동으로 checkAuth 호출
    useEffect(() => {
        checkAuth();
    }, [checkAuth]);

    return (
        <AuthContext.Provider value={{ isAuthenticated, user, isLoading, login, logout, checkAuth }}>
            {children}
        </AuthContext.Provider>
    );
}
