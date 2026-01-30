import { cva, type VariantProps } from "class-variance-authority";
import { ComponentPropsWithRef, ReactNode } from "react";

import { COLOR_SET } from "@/shared/styles/color_set";
import { cn } from "@/utils/cn";

type Props = ComponentPropsWithRef<"button"> &
    VariantProps<typeof buttonVariants> & {
        leftSlot?: ReactNode;
        rightSlot?: ReactNode;
    };

const Button = ({
    variant = "primary",
    size = "md",
    align = "center",
    leftSlot,
    rightSlot,
    children,
    className,
    ref,
    ...rest
}: Props) => {
    return (
        <button ref={ref} className={cn(buttonVariants({ variant, size, align }), className)} {...rest}>
            {leftSlot}

            <span className="flex-1">{children}</span>

            {rightSlot}
        </button>
    );
};

export default Button;

const buttonVariants = cva("flex flex-row gap-2 items-center whitespace-nowrap", {
    variants: {
        variant: {
            primary_accent: [COLOR_SET.primary_accent],
            primary: [COLOR_SET.primary],
            secondary: [COLOR_SET.secondary],
            tertiary: [COLOR_SET.tertiary],
            tertiary_outlined: [COLOR_SET.tertiary_outlined],
            quaternary: [COLOR_SET.quaternary],
            quaternary_outlined: [COLOR_SET.quaternary_outlined],
            quaternary_accent_outlined: [COLOR_SET.quaternary_accent_outlined],
            basic: [COLOR_SET.basic],
            basic_accent: [COLOR_SET.basic_accent],
            alert: [COLOR_SET.alert],
            ghost: "text-text-main2 bg-transparent hover:bg-gray-100",
        },
        size: {
            xs: "rounded-lg typo-body-14-medium py-2 px-3",
            sm: "rounded-2xl typo-body-14-medium py-3 px-4 min-w-20",
            md: "rounded-2xl typo-body-16-semibold w-full py-4 px-5",
            lg: "rounded-2xl typo-body-16-medium w-full py-5 px-10",
        },
        align: {
            left: "justify-start text-left",
            center: "justify-center text-center",
            right: "justify-end text-right",
        },
    },
});
