import { NodeColor } from "@features/mindmap/node/constants/colors";

export type NodeState = "default" | "highlight" | "selected";

export type NodeComponentProps = {
    colorIndex?: number;
    color?: NodeColor;
    opacity?: number;
};
