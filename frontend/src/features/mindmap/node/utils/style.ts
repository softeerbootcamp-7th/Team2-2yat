import {
    COLOR_CLASS_MAP,
    BG_CLASS_MAP,
    SHADOW_CLASS_MAP,
    type NodeColor,
} from "@features/mindmap/node/constants/colors";

export function shadowClass(color: NodeColor | undefined) {
    if (!color) return "";
    return SHADOW_CLASS_MAP[color];
}

export function colorBySize(size: "sm" | "md" | "lg", color: NodeColor | undefined, isSelected?: boolean) {
    const border = COLOR_CLASS_MAP.border[color][100];

    // selected일 때는 hover 스타일 제외 (border-2 유지)
    if (isSelected) {
        switch (size) {
            case "sm":
                return `border ${border} bg-white`;
            case "lg":
                return `border ${border} ${BG_CLASS_MAP[color][15]}`;
            case "md":
            default:
                return `border ${border} ${BG_CLASS_MAP[color][5]}`;
        }
    }

    switch (size) {
        case "sm":
            return `border ${border} bg-white hover:border hover:${border} hover:bg-white`;
        case "lg":
            return `border ${border} ${BG_CLASS_MAP[color][15]} hover:border hover:${border} hover:${BG_CLASS_MAP[color][15]}`;
        case "md":
        default:
            return `border ${border} ${BG_CLASS_MAP[color][5]} hover:border hover:${border} hover:${BG_CLASS_MAP[color][5]}`;
    }
}
