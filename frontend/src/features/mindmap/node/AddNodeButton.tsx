import { cn } from "@utils/cn";
import { getColorClass } from "@features/mindmap/node/utils/colors";
import { type NodeComponentProps } from "@features/mindmap/node/types/node";
import AddNodeHoverIcon from "@features/mindmap/node/AddNodeHoverIcon";

export default function AddNodeButton({ colorIndex = 0, className }: NodeComponentProps) {
    return (
        <button
            className={cn(
                "group relative flex items-center justify-center w-3 h-3 rounded-full cursor-pointer",
                getColorClass({ colorIndex }),
                className,
            )}
        >
            <div
                className="absolute inset-0 flex items-center justify-center
                            opacity-0 group-hover:opacity-100 
                            transition-all duration-300 ease-in-out"
            >
                <div className="z-10">
                    <AddNodeHoverIcon />
                </div>
            </div>
        </button>
    );
}
