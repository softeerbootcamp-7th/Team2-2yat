import { cn } from "@utils/cn";
import { type NodeComponentProps } from "@features/mindmap/node/types/node";
import AddNodeHoverIcon from "@features/mindmap/node/AddNodeHoverIcon";
import { getNodeColorClass } from "@utils/colors";

export default function AddNodeButton({ color }: NodeComponentProps) {
    return (
        <div className="group w-full h-full flex items-center justify-center">
            <div
                className={cn(
                    "group relative flex items-center justify-center w-3 h-3 rounded-full",
                    getNodeColorClass({ color }),
                )}
            >
                <div
                    className={cn(
                        "absolute inset-0 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300 ease-in-out",
                    )}
                >
                    <AddNodeHoverIcon color={color} />
                </div>
            </div>
        </div>
    );
}
