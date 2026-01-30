import { COLOR_CLASS_MAP, type NodeColor, SHADOW_CLASS_MAP } from "@/features/mindmap/node/constants/colors";
import { NodeMode } from "@/features/mindmap/node/types/node";

export function shadowClass(color: NodeColor) {
    return SHADOW_CLASS_MAP[color];
}

export function colorBySize({
    size,
    color,
    nodeMode,
}: {
    size: "sm" | "md" | "lg";
    color: NodeColor;
    nodeMode: NodeMode;
}) {
    const border = COLOR_CLASS_MAP.border[color][100];

    const STATE_SIZE_STYLES: Record<NodeMode, Record<"sm" | "md" | "lg", string>> = {
        default: {
            sm: `border ${border} bg-white`,
            md: `border ${border} ${COLOR_CLASS_MAP.bg[color][5]}`,
            lg: `border ${border} ${COLOR_CLASS_MAP.bg[color][15]}`,
        },
        highlight: {
            sm: `border-2 ${border} bg-white`,
            md: `border-2 ${border} ${COLOR_CLASS_MAP.bg[color][5]}`,
            lg: `border-2 ${border} ${COLOR_CLASS_MAP.bg[color][15]}`,
        },
        selected: {
            sm: `border-2 ${border} bg-white`,
            md: `border-2 ${border} ${COLOR_CLASS_MAP.bg[color][5]}`,
            lg: `border-2 ${border} ${COLOR_CLASS_MAP.bg[color][15]}`,
        },
    };

    return STATE_SIZE_STYLES[nodeMode][size];
}
