import { redirect } from "react-router";

import { AUTH_QUERY_KEYS } from "@/features/auth/constants/query_key";
import { User } from "@/features/auth/types/user";
import { USER_ME_ENDPOINT } from "@/shared/api/api";
import { get } from "@/shared/api/method";
import { queryClient } from "@/shared/api/query_client";
import { routeHelper } from "@/shared/utils/route";

export async function authMiddleWare() {
    let user = queryClient.getQueryData(AUTH_QUERY_KEYS.user);

    if (!user) {
        try {
            user = await get<User>({
                endpoint: USER_ME_ENDPOINT,
                options: { skipRefresh: true },
            });
            queryClient.setQueryData(AUTH_QUERY_KEYS.user, user);
        } catch {
            throw redirect(routeHelper.landing());
        }
    }
}
