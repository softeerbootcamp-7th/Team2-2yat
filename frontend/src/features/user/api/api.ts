import { ApiError, toSafeApiError } from "@/features/auth/types/api.types";
import { User } from "@/features/auth/types/user.types";
import { get } from "@/shared/api/method";

const USER_API = "/api/users";
const USER_ME_API = `${USER_API}/me`;

export const getUser = async (): Promise<User | ApiError> => {
    try {
        return await get<User>({ endpoint: USER_ME_API });
    } catch (error) {
        return toSafeApiError(error);
    }
};
