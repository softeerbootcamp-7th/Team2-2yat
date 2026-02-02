import { useContext } from "react";
import { createContext } from "react";

import type { AuthContextValue } from "@/features/auth/types/auth";

export const AuthContext = createContext<AuthContextValue | undefined>(undefined);

export function useAuth() {
    const context = useContext(AuthContext);
    if (!context) {
        throw new Error("useAuth must be used within an AuthProvider");
    }
    return context;
}
