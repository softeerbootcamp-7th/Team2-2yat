import { Link, Outlet } from "react-router";

import { useAuth } from "@/features/auth/hooks/useAuth";
import Button from "@/shared/components/button/Button";
import GlobalNavigationBar from "@/shared/components/global_navigation_bar/GlobalNavigationBar";
import UserBox from "@/shared/components/user_box/UserBox";
import { routeHelper } from "@/shared/utils/route";

const HomePage = () => {
    const { user } = useAuth();

    return (
        <>
            <GlobalNavigationBar
                rightSlot={
                    user ? (
                        <UserBox name={user.nickname} />
                    ) : (
                        <Link to={routeHelper.login()}>
                            <Button size="xs" variant="quaternary_accent_outlined">
                                로그인
                            </Button>
                        </Link>
                    )
                }
            />

            <main>
                <Outlet />
            </main>
        </>
    );
};

export default HomePage;
