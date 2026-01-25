export const NODE_COLORS = ["violet", "blue", "skyblue", "mint", "cyan", "purple", "magenta", "navy"] as const;
export type NodeColor = (typeof NODE_COLORS)[number];

type OpacityLevel = 5 | 10 | 15 | 20 | 30 | 100;

const COLOR_CLASS_MAP: Record<NodeColor, Record<OpacityLevel, string>> = {
    violet: {
        5: "bg-node-violet-op-5",
        10: "bg-node-violet-op-10",
        15: "bg-node-violet-op-15",
        20: "bg-node-violet-op-20",
        30: "bg-node-violet-op-30",
        100: "bg-node-violet-op-100",
    },
    blue: {
        5: "bg-node-blue-op-5",
        10: "bg-node-blue-op-10",
        15: "bg-node-blue-op-15",
        20: "bg-node-blue-op-20",
        30: "bg-node-blue-op-30",
        100: "bg-node-blue-op-100",
    },
    skyblue: {
        5: "bg-node-skyblue-op-5",
        10: "bg-node-skyblue-op-10",
        15: "bg-node-skyblue-op-15",
        20: "bg-node-skyblue-op-20",
        30: "bg-node-skyblue-op-30",
        100: "bg-node-skyblue-op-100",
    },
    mint: {
        5: "bg-node-mint-op-5",
        10: "bg-node-mint-op-10",
        15: "bg-node-mint-op-15",
        20: "bg-node-mint-op-20",
        30: "bg-node-mint-op-30",
        100: "bg-node-mint-op-100",
    },
    cyan: {
        5: "bg-node-cyan-op-5",
        10: "bg-node-cyan-op-10",
        15: "bg-node-cyan-op-15",
        20: "bg-node-cyan-op-20",
        30: "bg-node-cyan-op-30",
        100: "bg-node-cyan-op-100",
    },
    purple: {
        5: "bg-node-purple-op-5",
        10: "bg-node-purple-op-10",
        15: "bg-node-purple-op-15",
        20: "bg-node-purple-op-20",
        30: "bg-node-purple-op-30",
        100: "bg-node-purple-op-100",
    },
    magenta: {
        5: "bg-node-magenta-op-5",
        10: "bg-node-magenta-op-10",
        15: "bg-node-magenta-op-15",
        20: "bg-node-magenta-op-20",
        30: "bg-node-magenta-op-30",
        100: "bg-node-magenta-op-100",
    },
    navy: {
        5: "bg-node-navy-op-5",
        10: "bg-node-navy-op-10",
        15: "bg-node-navy-op-15",
        20: "bg-node-navy-op-20",
        30: "bg-node-navy-op-30",
        100: "bg-node-navy-op-100",
    },
};

/**
 * colorIndex 또는 color로 Tailwind 클래스 반환
 */
export function getNodeColorClass({ color, opacity = 100 }: { color?: NodeColor; opacity?: OpacityLevel }): string {
    return COLOR_CLASS_MAP[color][opacity];
}
