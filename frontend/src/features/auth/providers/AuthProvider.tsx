import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";

import { logout as logoutApi } from "@/features/auth/api/auth";
import { AuthContext } from "@/features/auth/hooks/useAuth";
import type { User } from "@/features/auth/types/user";
import { get } from "@/shared/api/method";

const USER_ENDPOINT = "/users";
const USER_ME_ENDPOINT = `${USER_ENDPOINT}/me`;

type AuthProviderProps = {
    children: React.ReactNode;
};

export function AuthProvider({ children }: AuthProviderProps) {
    const queryClient = useQueryClient();

    const { data: user, isLoading } = useQuery({
        queryKey: ["auth", "user"],
        queryFn: async () => get<User>({ endpoint: USER_ME_ENDPOINT }),
        staleTime: 1000 * 60 * 5,
    });

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
