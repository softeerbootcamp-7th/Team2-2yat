import { createContext } from "react";

import type { AuthContextValue } from "@/features/auth/types/auth";

export const AuthContext = createContext<AuthContextValue | undefined>(undefined);
