import { ComponentPropsWithoutRef } from "react";
import { cva, type VariantProps } from "class-variance-authority";
import { cn } from "@utils/cn";
import { type NodeColor } from "@features/mindmap/node/constants/colors";
import { colorBySize } from "@features/mindmap/node/utils/style";

type NodeProps = ComponentPropsWithoutRef<"div"> &
    VariantProps<typeof nodeVariants> & {
        color?: NodeColor;
    };

const nodeVariants = cva(
    "flex w-40 min-w-40 px-4.5 py-5 justify-center items-center gap-2.5 rounded-xl transition-shadow cursor-pointer outline-none",
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
    size = "md",
    color = "violet",
    className,
    children,
    ...rest
}: Omit<NodeProps, "status">) {
    const colorClass = colorBySize(size, color);

    return (
        <div className={cn(nodeVariants({ size }), colorClass, className)} {...rest}>
            {children}
        </div>
    );
}
