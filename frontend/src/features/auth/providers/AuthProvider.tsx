import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { useEffect } from "react";
import { useLocation, useNavigate } from "react-router";
import { toast } from "sonner";

import { logout as logoutApi } from "@/features/auth/api/auth";
import { isApiError } from "@/features/auth/api/error";
import { AUTH_QUERY_KEYS } from "@/features/auth/constants/query_key";
import { AuthContext } from "@/features/auth/hooks/useAuth";
import type { User } from "@/features/auth/types/user";
import { USER_ME_ENDPOINT } from "@/shared/api/api";
import { get } from "@/shared/api/method";
import { routeHelper } from "@/shared/utils/route";

type AuthProviderProps = {
    children: React.ReactNode;
};

export function AuthProvider({ children }: AuthProviderProps) {
    const queryClient = useQueryClient();
    const navigate = useNavigate();
    const { pathname } = useLocation();

    const {
        data: user,
        isLoading,
        error,
    } = useQuery({
        queryKey: [AUTH_QUERY_KEYS.user],
        queryFn: async () => get<User>({ endpoint: USER_ME_ENDPOINT, options: { skipRefresh: true } }),
        staleTime: 1000 * 60 * 5,
        retry: false,
    });

    useEffect(() => {
        if (isApiError(error) && error.status === 401) {
            const currentPath = pathname;

            // 끝에 붙은 / 제거
            const cleanPath = currentPath.endsWith("/") && currentPath !== "/" ? currentPath.slice(0, -1) : currentPath;

            const isExcludedPage = cleanPath === routeHelper.landing() || cleanPath === routeHelper.login();

            if (!isExcludedPage) {
                toast.error("로그인이 필요합니다.");
                navigate(routeHelper.login());
                queryClient.clear();
            }
        }
    }, [error]);

    const login = async (newUser: User): Promise<void> => {
        queryClient.setQueryData([AUTH_QUERY_KEYS.user], newUser);
    };

    const logoutMutation = useMutation({
        mutationFn: async () => logoutApi(),
        onSuccess: () => {
            queryClient.removeQueries({ queryKey: [AUTH_QUERY_KEYS.user] });
        },
    });

    const isAuthenticated = !!user && !logoutMutation.isPending;

    return (
        <AuthContext.Provider
            value={{
                isAuthenticated,
                user: user || null,
                isLoading,
                login,
                logout: logoutMutation.mutateAsync,
                checkAuth: () => queryClient.refetchQueries({ queryKey: [AUTH_QUERY_KEYS.user] }),
            }}
        >
            {children}
        </AuthContext.Provider>
    );
}
