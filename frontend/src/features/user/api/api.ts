import { toSafeApiError } from "@/features/auth/api/error";
import { ApiError } from "@/features/auth/types/api";
import { User } from "@/features/auth/types/user";
import { get } from "@/shared/api/method";

const USER_ENDPOINT = "/users";
const USER_ME_ENDPOINT = `${USER_ENDPOINT}/me`;

export const getUser = async (): Promise<User | ApiError> => {
    try {
        return await get<User>({ endpoint: USER_ME_ENDPOINT });
    } catch (error) {
        return toSafeApiError(error);
    }
};
