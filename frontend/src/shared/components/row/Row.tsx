import { cva, VariantProps } from "class-variance-authority";
import { ComponentPropsWithoutRef, ReactNode } from "react";

import { cn } from "@/utils/cn";

type Props = ComponentPropsWithoutRef<"li"> &
    VariantProps<typeof variants> & {
        leftSlot?: ReactNode;
        contents?: ReactNode;
        rightSlot?: ReactNode;
    };

const Row = ({ yPadding = "none", xPadding = "none", leftSlot, contents, className, rightSlot, ...rest }: Props) => {
    return (
        <li className={cn(variants({ yPadding, xPadding }), className)} {...rest}>
            <div className="flex flex-row gap-2 items-center">
                {leftSlot}
                {contents}
            </div>

            {rightSlot}
        </li>
    );
};

export default Row;

const variants = cva(
    "p-0 h-fit w-full flex flex-row justify-between items-center text-text-sub1 hover:text-primary hover:bg-cobalt-100",
    {
        variants: {
            yPadding: {
                none: "py-0",
                sm: "py-2",
                md: "py-3",
                lg: "py-4",
            },
            xPadding: {
                none: "px-0",
                sm: "px-2",
                md: "px-3",
                lg: "px-5",
                xl: "px-8",
            },
        },
    },
);
