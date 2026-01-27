import {
    COLOR_CLASS_MAP,
    BG_CLASS_MAP,
    SHADOW_CLASS_MAP,
    type NodeColor,
} from "@features/mindmap/node/constants/colors";

import { NodeState } from "../types/node";

export function shadowClass(color: NodeColor) {
    return SHADOW_CLASS_MAP[color];
}

export function colorBySize(size: "sm" | "md" | "lg", color: NodeColor, state: NodeState) {
    const border = COLOR_CLASS_MAP.border[color][100];

    const STATE_SIZE_STYLES: Record<NodeState, Record<"sm" | "md" | "lg", string>> = {
        default: {
            sm: `border-2 ${border} bg-white`,
            md: `border-2 ${border} ${BG_CLASS_MAP[color][5]}`,
            lg: `border-2 ${border} ${BG_CLASS_MAP[color][15]}`,
        },
        selected: {
            sm: `border ${border} bg-white hover:border hover:${border} hover:bg-white`,
            md: `border ${border} ${BG_CLASS_MAP[color][5]} hover:border hover:${border} hover:${BG_CLASS_MAP[color][5]}`,
            lg: `border ${border} ${BG_CLASS_MAP[color][15]} hover:border hover:${border} hover:${BG_CLASS_MAP[color][15]}`,
        },
    };

    return STATE_SIZE_STYLES[state][size];
}
