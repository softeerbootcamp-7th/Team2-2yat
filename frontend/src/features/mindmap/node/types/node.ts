import { NODE_COLORS } from "@features/mindmap/node/utils/colors";

export type NodeComponentProps = {
    colorIndex?: number;
    color?: (typeof NODE_COLORS)[number];
    opacity?: number;
    className?: string;
};
