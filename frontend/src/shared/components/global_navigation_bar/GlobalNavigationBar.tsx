import { cva } from "class-variance-authority";
import { ReactNode } from "react";
import { Link, useLocation, useNavigate } from "react-router";

import Button from "@/shared/components/button/Button";
import Icon from "@/shared/components/icon/Icon";
import { routeHelper } from "@/shared/utils/route";

type Props = {
    rightSlot?: ReactNode;
    variant?: "white" | "transparent";
};

export default function GlobalNavigationBar({ variant = "white", rightSlot }: Props) {
    const navigate = useNavigate();
    const location = useLocation();

    const includePath = (targetPath: string) => {
        return location.pathname.includes(targetPath);
    };

    return (
        <div className={variants({ variant })}>
            <Link to="/">
                <Icon name="ic_logo" viewBox="0 0 87 16" height="16px" width="87px" />
            </Link>
            <div className="flex flex-row gap-1 flex-1">
                <Button
                    size="sm"
                    onClick={() => navigate(routeHelper.mindmap.list())}
                    variant={includePath(routeHelper.mindmap.list()) ? "tertiary" : "ghost"}
                >
                    마인드맵
                </Button>
                <Button
                    size="sm"
                    onClick={() => navigate(routeHelper.episode_archive())}
                    variant={includePath(routeHelper.episode_archive()) ? "tertiary" : "ghost"}
                >
                    에피소드 보관함
                </Button>
                <Button
                    size="sm"
                    onClick={() => navigate(routeHelper.self_diagnosis.list())}
                    variant={includePath(routeHelper.self_diagnosis.list()) ? "tertiary" : "ghost"}
                >
                    기출문항 셀프진단
                </Button>
            </div>

            {rightSlot}
        </div>
    );
}

const variants = cva("w-full h-18.5 border-b  py-4 px-9 flex flex-row items-center gap-10", {
    variants: {
        variant: {
            white: "bg-white border-gray-300",
            transparent: "bg-white-op-20 border-white",
        },
    },
});
