import { cn } from "@utils/cn";
import { cva, VariantProps } from "class-variance-authority";
import { ReactNode } from "react";

type Props = VariantProps<typeof variants> & {
    children: ReactNode;
};

const MaxWidth = ({ gap = "none", maxWidth = "md", direction = "y", align = "center", children }: Props) => {
    return (
        <div className="w-full flex justify-center items-center ">
            <div className={cn(variants({ gap, maxWidth, direction, align }))}>{children}</div>
        </div>
    );
};

export default MaxWidth;

const variants = cva("flex", {
    variants: {
        maxWidth: {
            sm: "max-w-sm",
            md: "max-w-md",
            lg: "max-w-lg",
        },
        direction: {
            y: "flex-col",
            x: "flex-row",
        },
        align: {
            center: "items-center",
            left: "items-start",
            right: "items-end",
        },
        gap: {
            none: "",
            sm: "gap-4",
            md: "gap-8",
            lg: "gap-12.5",
        },
    },
});
