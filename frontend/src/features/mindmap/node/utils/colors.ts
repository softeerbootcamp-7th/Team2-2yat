import type { NodeComponentProps } from "@features/mindmap/node/types/node";

export const NODE_COLORS = ["violet", "blue", "skyblue", "mint", "cyan", "purple", "magenta", "navy"] as const;

/*
/**
 * CSS 변수 형태로 색상 스타일 반환
 */
export function getColorStyle({ colorIndex, color, opacity }: NodeComponentProps): string {
    if (color) {
        return `var(--color-node-${color}-op-${opacity})`;
    }
    const colorName = NODE_COLORS[colorIndex % NODE_COLORS.length];

    return `var(--color-node-${colorName}-op-${opacity})`;
}
