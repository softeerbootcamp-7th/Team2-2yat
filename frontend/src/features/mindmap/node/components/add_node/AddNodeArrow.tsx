import { ComponentPropsWithoutRef } from "react";

import { COLOR_CLASS_MAP, NodeColor } from "@/features/mindmap/node/constants/colors";
import Icon from "@/shared/components/icon/Icon";
import { cn } from "@/utils/cn";

type DirectionVariantProps = {
    direction: "left" | "right";
};

type Props = Omit<ComponentPropsWithoutRef<"button">, "color"> &
    DirectionVariantProps & {
        color: NodeColor;
    };

const DIRECTION_ROTATE_MAP: Record<DirectionVariantProps["direction"], number> = {
    left: 310,
    right: 135,
};

export default function AddNodeArrow({ color, direction }: Props) {
    const handleAddNode = () => {
        // TODO: menu 컴포넌트 생성
    };

    const centerClass = "flex items-center justify-center rounded-full";

    const outerCircleClass = cn("w-13.5 h-13.5 cursor-pointer", centerClass, COLOR_CLASS_MAP.bg[color][15]);
    const iconCircleClass = cn("w-11 h-11 border-base-white border-3", centerClass, COLOR_CLASS_MAP.bg[color][100]);

    return (
        <button onClick={handleAddNode} className={outerCircleClass}>
            <div className={iconCircleClass}>
                <Icon
                    name="ic_tool_move"
                    color="var(--color-base-white)"
                    fill="var(--color-base-white)"
                    size={17}
                    rotate={DIRECTION_ROTATE_MAP[direction]}
                />
            </div>
        </button>
    );
}
