import { ComponentPropsWithoutRef, useState } from "react";
import Icon from "@shared/components/icon/Icon";
import Button from "@shared/components/button/Button";
import Row from "@shared/components/row/Row";
import { cn } from "@utils/cn";
import Profile from "../profile/profile";

type Props = ComponentPropsWithoutRef<"div"> & {
    contents: string[];
    isLanding?: boolean;
    onClick?: (index: number) => void;
};

export default function GlobalNavigationBar({ isLanding = false, contents, onClick }: Props) {
    const [selectedTab, setSelectedTab] = useState(0);

    const handleTab = (index: number) => {
        setSelectedTab(index);
        if (onClick) {
            onClick(index);
        }
    };

    return (
        <div className={cn("w-full h-full p-4", isLanding ? "bg-base-white" : "bg-white-op-20")}>
            <Row
                className="h-full"
                yPadding="none"
                leftSlot={<Icon name="ic_logo" size="100%" color="var(--color-text-main1)" />}
                contents={
                    <div className="flex h-full gap-2">
                        {contents.map((tab, index) => (
                            <Button
                                key={index}
                                variant={selectedTab === index ? "basic_accent" : "quaternary"}
                                size="full"
                                onClick={() => handleTab(index)}
                            >
                                {tab}
                            </Button>
                        ))}
                    </div>
                }
                rightSlot={<Profile name="박은서" />}
            />
        </div>
    );
}
