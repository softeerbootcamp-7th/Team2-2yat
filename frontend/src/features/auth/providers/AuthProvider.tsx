import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { useEffect, useRef } from "react";
import { useLocation, useNavigate } from "react-router";
import { toast } from "sonner";

import { logout as logoutApi } from "@/features/auth/api/auth";
import { isApiError } from "@/features/auth/api/error";
import { AuthContext } from "@/features/auth/hooks/useAuth";
import type { User } from "@/features/auth/types/user";
import { USER_ME_ENDPOINT } from "@/shared/api/api";
import { get } from "@/shared/api/method";

type AuthProviderProps = {
    children: React.ReactNode;
};

export function AuthProvider({ children }: AuthProviderProps) {
    const queryClient = useQueryClient();
    const navigate = useNavigate();
    const { pathname } = useLocation();
    const pathnameRef = useRef(pathname);

    const {
        data: user,
        isLoading,
        error,
    } = useQuery({
        queryKey: ["auth", "user"],
        queryFn: async () => get<User>({ endpoint: USER_ME_ENDPOINT, options: { skipRefresh: true } }),
        staleTime: 1000 * 60 * 5,
        retry: false,
    });

    // 페이지 이동 시 ref만 업데이트(useEffect 실행 안 함)
    useEffect(() => {
        pathnameRef.current = pathname;
    }, [pathname]);

    useEffect(() => {
        if (isApiError(error) && error.status === 401) {
            const currentPath = pathnameRef.current;

            // 끝에 붙은 / 제거
            const cleanPath = currentPath.endsWith("/") && currentPath !== "/" ? currentPath.slice(0, -1) : currentPath;

            const isExcludedPage = ["/", "/landing", "/login"].includes(cleanPath);

            if (!isExcludedPage) {
                toast.error("로그인이 필요합니다.");
                navigate("/login");
                queryClient.clear();
            }
        }
    }, [error]);

    const login = async (newUser: User): Promise<void> => {
        queryClient.setQueryData(["auth", "user"], newUser);
    };

    const logoutMutation = useMutation({
        mutationFn: async () => logoutApi(),
        onSuccess: () => {
            queryClient.removeQueries({ queryKey: ["auth", "user"] });
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
                checkAuth: () => queryClient.refetchQueries({ queryKey: ["auth", "user"] }),
            }}
        >
            {children}
        </AuthContext.Provider>
    );
}
