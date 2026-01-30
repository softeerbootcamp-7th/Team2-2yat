import { Outlet } from "react-router";

import GlobalNavigationBar from "@/shared/components/global_navigation_bar/GlobalNavigationBar";
import UserBox from "@/shared/components/user_box/UserBox";

const HomePage = () => {
    return (
        <>
            <GlobalNavigationBar rightSlot={<UserBox name="asdf" />} />

            <main>
                <Outlet />
            </main>
        </>
    );
};

export default HomePage;
