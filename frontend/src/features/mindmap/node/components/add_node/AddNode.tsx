import { cva, type VariantProps } from "class-variance-authority";
import { ComponentPropsWithoutRef } from "react";

import AddNodeArrow from "@/features/mindmap/node/components/add_node/AddNodeArrow";
import AddNodeDot from "@/features/mindmap/node/components/add_node/AddNodeDot";
import { NodeColor } from "@/features/mindmap/node/constants/colors";
import { cn } from "@/utils/cn";

const addNodeVariants = cva(
    "relative w-13.5 h-13.5 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300",
    {
        variants: {
            direction: {
                left: "order-first",
                right: "order-last",
            },
        },
    },
);

type Props = ComponentPropsWithoutRef<"div"> &
    VariantProps<typeof addNodeVariants> & {
        color: NodeColor;
        direction: "left" | "right";
    };

export default function AddNode({ color, direction, className, ...rest }: Props) {
    return (
        <div {...rest} className={cn(addNodeVariants({ direction }), className)}>
            <div className="transition-opacity duration-300">
                <AddNodeDot color={color} />
            </div>
            <div className="absolute inset-0 flex items-center justify-center transition-opacity duration-300 hover:opacity-100 opacity-0">
                <AddNodeArrow color={color} direction={direction} />
            </div>
        </div>
    );
}
