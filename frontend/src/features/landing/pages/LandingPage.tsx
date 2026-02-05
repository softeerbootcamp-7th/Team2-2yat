import { Link } from "react-router";

import { useAuth } from "@/features/auth/hooks/useAuth";
import Button from "@/shared/components/button/Button";
import GlobalNavigationBar from "@/shared/components/global_navigation_bar/GlobalNavigationBar";
import Popover from "@/shared/components/popover/Popover";
import UserBox from "@/shared/components/user_box/UserBox";
import { routeHelper } from "@/shared/utils/route";

const LandingPage = () => {
    const { user, logout } = useAuth();

    return (
        <>
            <div className="relative overflow-hidden min-h-screen w-full bg-cover bg-center bg-no-repeat bg-[url('/landing_bg.png')]">
                <GlobalNavigationBar
                    variant="transparent"
                    rightSlot={
                        user ? (
                            <Popover
                                direction="bottom_left"
                                contents={
                                    <button
                                        type="button"
                                        onClick={logout}
                                        className="bg-white border border-gray-200 rounded-lg px-4 py-2 typo-body-14-medium text-text-main2 shadow-md"
                                    >
                                        로그아웃
                                    </button>
                                }
                            >
                                <UserBox name={user.nickname} />
                            </Popover>
                        ) : (
                            <Link to={routeHelper.login()}>
                                <Button size="xs" variant="quaternary_accent_outlined">
                                    로그인
                                </Button>
                            </Link>
                        )
                    }
                />

                <main className="flex flex-col items-center justify-center pt-20">
                    <h1 className="text-base-white typo-title-36-bold">환영합니다!</h1>
                </main>
            </div>
        </>
    );
};

export default LandingPage;
