import Icon from "@shared/components/icon/Icon";
import MaxWidth from "@shared/components/max_width/MaxWidth";
import Spacer from "@shared/components/spacer/Spacer";
import Top from "@shared/components/top/Top";

const LoginPage = () => {
    return (
        <MaxWidth align="center" gap="lg" maxWidth="lg">
            <Spacer y={70} />
            <Top
                align="center"
                lowerGap="lg"
                title={<div className="typo-title-30-bold text-base-navy">안녕하세요!</div>}
                lower={
                    <div className="typo-title-20-medium text-base-navy">
                        episode와 함께 경험을 체계적으로 정리해보세요.
                    </div>
                }
            />

            <button className="flex flex-row gap-4 justify-center items-center w-full bg-[#FEE500] rounded-xl py-3">
                <Icon name="ic_kakao_login" color="var(--color-black)" size={18} />
                <div>카카오로 시작하기</div>
            </button>

            <div className="typo-caption-12-medium text-text-sub1">
                로그인하면 개인정보 처리방침 및 이용약관에 동의하게 됩니다.
            </div>
        </MaxWidth>
    );
};

export default LoginPage;
