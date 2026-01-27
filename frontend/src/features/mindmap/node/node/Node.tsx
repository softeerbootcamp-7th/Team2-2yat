import { ComponentPropsWithoutRef } from "react";
import { cva, type VariantProps } from "class-variance-authority";
import { cn } from "@utils/cn";
import { type NodeColor } from "@features/mindmap/node/constants/colors";
import { colorBySize, shadowClass } from "@features/mindmap/node/utils/style";
import AddNode from "@features/mindmap/node/add_node/AddNode";
import MenuNodeButton from "@features/mindmap/node/menu_node/MenuNodeButton";

type NodeProps = {
    id: string;
    text: string;
    color?: NodeColor;
    direction?: "left" | "right";
    isSelected?: boolean;
    onSelectedChange?: (selected: boolean) => void;
};

type Props = ComponentPropsWithoutRef<"div"> & VariantProps<typeof nodeVariants> & NodeProps;

const nodeVariants = cva(
    "relative flex w-40 px-4.5 py-5 justify-center items-center gap-2.5 rounded-xl transition-shadow cursor-pointer outline-none",
    {
        variants: {
            size: {
                sm: "typo-body-14-medium text-text-main2",
                md: "typo-body-14-semibold text-text-main2",
                lg: "typo-body-16-semibold text-text-main1",
            },
        },
    },
);

export default function Node({
    size = "sm",
    color = "violet",
    text = "",
    direction,
    isSelected = false,
    onSelectedChange,
    className,
    ...rest
}: Props) {
    const colorClass = colorBySize(size, color, isSelected);
    const selectedStyles = isSelected ? `border-2 ${shadowClass(color)}` : "";

    return (
        <div className={`group relative flex items-center gap-2`} {...rest}>
            {direction === "left" && (
                <AddNode
                    color={color}
                    direction="left"
                    className="opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none group-hover:pointer-events-auto"
                />
            )}
            <div
                className={cn(nodeVariants({ size }), colorClass, selectedStyles, className)}
                onClick={() => {
                    if (onSelectedChange) {
                        onSelectedChange(!isSelected);
                    }
                }}
            >
                {text}
                <MenuNodeButton
                    color={color}
                    className={cn(
                        "absolute top-0 right-0 transition-opacity duration-300",
                        isSelected ? "opacity-100" : "opacity-0 group-hover:opacity-100",
                    )}
                />
            </div>
            {direction === "right" && (
                <AddNode
                    color={color}
                    direction="right"
                    className="opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none group-hover:pointer-events-auto"
                />
            )}
        </div>
    );
}
