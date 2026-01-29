import { cn } from "@utils/cn";
import { COLOR_CLASS_MAP, NodeColor } from "@features/mindmap/node/constants/colors";

export default function AddNodeDot({ color }: { color: NodeColor }) {
    return <div className={cn("w-3 h-3 rounded-full", COLOR_CLASS_MAP.bg[color][100])} />;
}
