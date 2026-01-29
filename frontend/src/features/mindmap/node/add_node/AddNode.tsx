import { ComponentPropsWithoutRef } from "react";
import AddNodeDot from "@features/mindmap/node/add_node/AddNodeDot";
import AddNodeArrow from "@features/mindmap/node/add_node/AddNodeArrow";
import { cn } from "@utils/cn";
import { NodeColor } from "@features/mindmap/node/constants/colors";

type Props = ComponentPropsWithoutRef<"div"> & {
    color: NodeColor;
    direction: "left" | "right";
};

export default function AddNode({ color, direction, className, ...rest }: Props) {
    return (
        <div {...rest} className={cn("relative w-13.5 h-13.5 flex items-center justify-center", className)}>
            <div className="transition-opacity duration-300">
                <AddNodeDot color={color} />
            </div>
            <div className="absolute inset-0 flex items-center justify-center transition-opacity duration-300 hover:opacity-100 opacity-0">
                <AddNodeArrow color={color} direction={direction} />
            </div>
        </div>
    );
}
