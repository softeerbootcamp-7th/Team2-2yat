import { toSafeApiError } from "@/features/auth/api/error";
import { ApiError } from "@/features/auth/types/api";
import { User } from "@/features/auth/types/user";
import { get } from "@/shared/api/method";

const USER_API = "/users";
const USER_ME_API = `${USER_API}/me`;

export const getUser = async (): Promise<User | ApiError> => {
    try {
        return await get<User>({ endpoint: USER_ME_API });
    } catch (error) {
        return toSafeApiError(error);
    }
};
