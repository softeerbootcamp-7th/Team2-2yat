import { ComponentPropsWithoutRef, useState } from "react";
import Icon from "@shared/components/icon/Icon";
import Button from "@shared/components/button/Button";
import Row from "@shared/components/row/Row";
import { cn } from "@utils/cn";

type Props = ComponentPropsWithoutRef<"div"> & {
    tabs: string[];
    isLanding?: boolean;
    onClick?: (index: number) => void;
};

export default function GlobalNavigationBar({ isLanding = false, tabs, onClick }: Props) {
    const [selectedTab, setSelectedTab] = useState(0);

    return (
        <div className={cn("w-full h-full p-4", isLanding ? "bg-base-white" : "bg-white-op-20")}>
            <Row
                className="h-full"
                yPadding="none"
                leftSlot={<Icon name="ic_logo" size="100%" color="var(--color-text-main1)" />}
                contents={
                    <div className="flex h-full gap-2">
                        {tabs.map((tab, index) => (
                            <Button
                                key={index}
                                variant={selectedTab === index ? "basic_accent" : "quaternary"}
                                size="full"
                                onClick={() => {
                                    setSelectedTab(index);
                                    onClick(index);
                                }}
                            >
                                {tab}
                            </Button>
                        ))}
                    </div>
                }
                rightSlot={
                    <div className="flex h-full gap-2">
                        <Button variant="quaternary_accent_outlined" size="full">
                            로그인
                        </Button>
                        <Button variant="primary" size="full">
                            회원가입
                        </Button>
                    </div>
                }
            />
        </div>
    );
}
