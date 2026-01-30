export const NODE_COLORS = ["violet", "blue", "skyblue", "mint", "cyan", "purple", "magenta", "navy"] as const;
export type NodeColor = (typeof NODE_COLORS)[number];

export type OpacityLevel = 5 | 10 | 15 | 20 | 30 | 100;

type ColorClassMap = {
    bg: Record<NodeColor, Record<OpacityLevel, string>>;
    border: Record<NodeColor, Record<OpacityLevel, string>>;
};

export const COLOR_CLASS_MAP: ColorClassMap = {
    bg: {
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
    },
    border: {
        violet: {
            5: "border-node-violet-op-5",
            10: "border-node-violet-op-10",
            15: "border-node-violet-op-15",
            20: "border-node-violet-op-20",
            30: "border-node-violet-op-30",
            100: "border-node-violet-op-100",
        },
        blue: {
            5: "border-node-blue-op-5",
            10: "border-node-blue-op-10",
            15: "border-node-blue-op-15",
            20: "border-node-blue-op-20",
            30: "border-node-blue-op-30",
            100: "border-node-blue-op-100",
        },
        skyblue: {
            5: "border-node-skyblue-op-5",
            10: "border-node-skyblue-op-10",
            15: "border-node-skyblue-op-15",
            20: "border-node-skyblue-op-20",
            30: "border-node-skyblue-op-30",
            100: "border-node-skyblue-op-100",
        },
        mint: {
            5: "border-node-mint-op-5",
            10: "border-node-mint-op-10",
            15: "border-node-mint-op-15",
            20: "border-node-mint-op-20",
            30: "border-node-mint-op-30",
            100: "border-node-mint-op-100",
        },
        cyan: {
            5: "border-node-cyan-op-5",
            10: "border-node-cyan-op-10",
            15: "border-node-cyan-op-15",
            20: "border-node-cyan-op-20",
            30: "border-node-cyan-op-30",
            100: "border-node-cyan-op-100",
        },
        purple: {
            5: "border-node-purple-op-5",
            10: "border-node-purple-op-10",
            15: "border-node-purple-op-15",
            20: "border-node-purple-op-20",
            30: "border-node-purple-op-30",
            100: "border-node-purple-op-100",
        },
        magenta: {
            5: "border-node-magenta-op-5",
            10: "border-node-magenta-op-10",
            15: "border-node-magenta-op-15",
            20: "border-node-magenta-op-20",
            30: "border-node-magenta-op-30",
            100: "border-node-magenta-op-100",
        },
        navy: {
            5: "border-node-navy-op-5",
            10: "border-node-navy-op-10",
            15: "border-node-navy-op-15",
            20: "border-node-navy-op-20",
            30: "border-node-navy-op-30",
            100: "border-node-navy-op-100",
        },
    },
};

export const SHADOW_CLASS_MAP: Record<NodeColor, string> = {
    violet: "shadow-[0_0_30px_5px_var(--color-node-violet-op-20)]",
    blue: "shadow-[0_0_30px_5px_var(--color-node-blue-op-20)]",
    skyblue: "shadow-[0_0_30px_5px_var(--color-node-skyblue-op-20)]",
    mint: "shadow-[0_0_30px_5px_var(--color-node-mint-op-20)]",
    cyan: "shadow-[0_0_30px_5px_var(--color-node-cyan-op-20)]",
    purple: "shadow-[0_0_30px_5px_var(--color-node-purple-op-20)]",
    magenta: "shadow-[0_0_30px_5px_var(--color-node-magenta-op-20)]",
    navy: "shadow-[0_0_30px_5px_var(--color-node-navy-op-20)]",
};
