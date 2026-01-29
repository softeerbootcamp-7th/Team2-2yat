import AddNode from "@features/mindmap/node/add_node/AddNode";
import { type NodeColor } from "@features/mindmap/node/constants/colors";
import MenuNodeButton from "@features/mindmap/node/menu_node/MenuNodeButton";
import { NodeState } from "@features/mindmap/node/types/node";
import { colorBySize, shadowClass } from "@features/mindmap/node/utils/style";
import { cn } from "@utils/cn";
import { cva, type VariantProps } from "class-variance-authority";
import { ComponentPropsWithoutRef, ReactNode } from "react";

type Props = ComponentPropsWithoutRef<"div"> & {
    children?: ReactNode;
};

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

function Node({ className, children, ...rest }: Props) {
    return (
        <div className={cn("group relative flex items-center gap-2", className)} {...rest}>
            {children}
        </div>
    );
}

function NodeAddon({ direction, color }: { direction: "left" | "right"; color: NodeColor }) {
    const positionClass = direction === "right" ? "order-last" : "order-first";

    return (
        <AddNode
            color={color}
            direction={direction}
            className={cn(
                "opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none group-hover:pointer-events-auto",
                positionClass,
            )}
        />
    );
}

type NodeContentProps = ComponentPropsWithoutRef<"div"> &
    VariantProps<typeof nodeVariants> & {
        color: NodeColor;
        state: NodeState;
        onStateChange?: (selected: boolean) => void;
        children: ReactNode;
    };

function NodeContent({ size = "sm", color, state, onStateChange, className, children, ...rest }: NodeContentProps) {
    const colorClass = colorBySize(size, color, state);
    const selectedStyles = state === "selected" ? `border-2 ${shadowClass(color)}` : "";

    return (
        <div
            className={cn(nodeVariants({ size }), colorClass, selectedStyles, className)}
            onClick={() => {
                if (onStateChange) {
                    onStateChange(state === "default");
                }
            }}
            {...rest}
        >
            {children}
            <MenuNodeButton
                color={color}
                className={cn(
                    "absolute top-0 right-0 transition-opacity duration-300",
                    state === "selected" ? "opacity-100" : "opacity-0 group-hover:opacity-100",
                )}
            />
        </div>
    );
}

Node.Addon = NodeAddon;
Node.Content = NodeContent;

export default Node;
