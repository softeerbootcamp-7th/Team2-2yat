import { redirect } from "react-router";

import { User } from "@/features/auth/types/user";
import { get } from "@/shared/api/method";
import { queryClient } from "@/shared/api/query_client";

const USER_ME_ENDPOINT = "/users/me";

export async function middleWare() {
    let user = queryClient.getQueryData(["auth", "user"]);

    if (!user) {
        try {
            user = await get<User>({
                endpoint: USER_ME_ENDPOINT,
                options: { skipRefresh: true },
            });
            queryClient.setQueryData(["auth", "user"], user);
        } catch {
            throw redirect("/landing");
        }
    }
}
