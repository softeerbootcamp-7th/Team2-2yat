import Button from "@shared/components/button/Button";
import GlobalNavigationBar from "@shared/components/global_navigation_bar/GlobalNavigationBar";

const LandingPage = () => {
    return (
        <>
            <div className="relative w-full bg-cover bg-center bg-no-repeat bg-[url('/landing_bg.png')]">
                <GlobalNavigationBar
                    variant="transparent"
                    rightSlot={
                        <div className="flex flex-row gap-2">
                            <Button size="xs" variant="quaternary_accent_outlined">
                                로그인
                            </Button>
                            <Button size="xs" variant="primary">
                                가입하기
                            </Button>
                        </div>
                    }
                />

                <main className="flex flex-col items-center justify-center pt-20">
                    <h1 className="text-white text-4xl font-bold">환영합니다!</h1>
                </main>
            </div>
        </>
    );
};

export default LandingPage;
