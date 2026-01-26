import { getNodeColorClass, type NodeColor, type OpacityLevel } from "@features/mindmap/node/constants/colors";

export const bgClass = (color: NodeColor | undefined, opacity: OpacityLevel = 100) =>
    getNodeColorClass({ color, opacity });

export const borderClass = (color: NodeColor | undefined, opacity: OpacityLevel = 100) =>
    bgClass(color, opacity).replace(/^bg-/, "border-");

export const shadowClass = (color: NodeColor | undefined) => {
    const token = bgClass(color, 30).replace(/^bg-/, "--color-");
    return `shadow-[0_0_15px_0_var(${token})]`;
};

export const colorBySize = (size: "sm" | "md" | "lg", color: NodeColor | undefined, isSelected?: boolean) => {
    const border = borderClass(color, 100);

    // selected일 때는 hover 스타일 제외 (border-2 유지)
    if (isSelected) {
        switch (size) {
            case "sm":
                return `border ${border} bg-white`;
            case "lg":
                return `border ${border} ${bgClass(color, 15)}`;
            case "md":
            default:
                return `border ${border} ${bgClass(color, 5)}`;
        }
    }

    // default/hover일 때는 hover 스타일 포함
    switch (size) {
        case "sm":
            return `border ${border} bg-white hover:border hover:${border} hover:bg-white`;
        case "lg":
            return `border ${border} ${bgClass(color, 15)} hover:border hover:${border} hover:${bgClass(color, 15)}`;
        case "md":
        default:
            return `border ${border} ${bgClass(color, 5)} hover:border hover:${border} hover:${bgClass(color, 5)}`;
    }
};
