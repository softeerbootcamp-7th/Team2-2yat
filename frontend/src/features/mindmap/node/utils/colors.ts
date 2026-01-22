import type { NodeComponentProps } from "@features/mindmap/node/types/node";

const NODE_COLORS = ["violet", "blue", "skyblue", "mint", "cyan", "purple", "magenta", "navy"] as const;

export const getColorClass = ({ colorIndex = 0 }: NodeComponentProps) => {
    const index = colorIndex % NODE_COLORS.length;

    return `bg-node-${NODE_COLORS[index]}-op-100`;
};
