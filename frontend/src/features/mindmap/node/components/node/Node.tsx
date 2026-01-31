import { cva } from "class-variance-authority";
import { ComponentPropsWithoutRef, ReactNode, useState } from "react";

import AddNode from "@/features/mindmap/node/add_node/AddNode";
import MenuNodeButton from "@/features/mindmap/node/components/menu_node/MenuNodeButton";
import { NodeColor } from "@/features/mindmap/node/constants/colors";
import { NodeMode } from "@/features/mindmap/node/types/node";
import { colorBySize, shadowClass } from "@/features/mindmap/node/utils/style";
import { cn } from "@/utils/cn";
import { SafeVariantProps } from "@/shared/types/safe_variant_props";

type Props = ComponentPropsWithoutRef<"div"> & {
    children?: ReactNode;
};

export const nodeVariants = cva(
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

const menuButtonVariants = cva("absolute top-0 right-0 transition-opacity duration-300", {
    variants: {
        nodeMode: {
            default: "opacity-0",
            highlight: "opacity-0",
            selected: "opacity-100",
        },
    },
});

function NodeComponent({ className, children, ...rest }: Props) {
    return (
        <div className={cn("group relative flex items-center gap-2", className)} {...rest}>
            {children}
        </div>
    );
}

type NodeContentProps = ComponentPropsWithoutRef<"div"> &
    SafeVariantProps<typeof nodeVariants> & {
        color: NodeColor;
        highlight?: boolean;
        children: ReactNode;
    };

function NodeContent({
    size = "sm",
    color,
    highlight = false,
    className,
    children,
    onClick,
    ...rest
}: NodeContentProps) {
    const [isSelected, setIsSelected] = useState(false);

    const getNodeMode = (): NodeMode => {
        if (isSelected) return "selected";
        if (highlight) return "highlight";
        return "default";
    };
    const nodeMode = getNodeMode();

    const colorClass = colorBySize({ size, color, nodeMode });
    const variantStyles = nodeMode === "selected" || nodeMode === "highlight" ? `${shadowClass(color)}` : "";

    const handleClick = (e: React.MouseEvent<HTMLDivElement>) => {
        setIsSelected((prev) => !prev);
        if (onClick) {
            onClick(e);
        }
    };
    return (
        <div
            className={cn(nodeVariants({ size }), colorClass, variantStyles, className)}
            onClick={handleClick}
            {...rest}
        >
            {children}
            <MenuNodeButton color={color} className={menuButtonVariants({ nodeMode })} />
        </div>
    );
}

export const Node = Object.assign(NodeComponent, {
    AddNode: AddNode,
    Content: NodeContent,
});
