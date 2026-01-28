import { ComponentPropsWithoutRef, ReactNode } from "react";
import { cva, type VariantProps } from "class-variance-authority";
import { COLOR_SET } from "@shared/styles/color_set";
import { cn } from "@utils/cn";

type Props = ComponentPropsWithoutRef<"button"> &
    VariantProps<typeof buttonVariants> & {
        leftSlot?: ReactNode;
        rightSlot?: ReactNode;
    };

const Button = ({ variant = "primary", size = "md", leftSlot, rightSlot, children, className, ...rest }: Props) => {
    return (
        <button className={cn(buttonVariants({ variant, size }), className)} {...rest}>
            {leftSlot ? leftSlot : null}
            {children}
            {rightSlot ? rightSlot : null}
        </button>
    );
};

export default Button;

const buttonVariants = cva("rounded-2xl flex flex-row gap-2 justify-center items-center", {
    variants: {
        variant: {
            primary_accent: [COLOR_SET.primary_accent],
            primary: [COLOR_SET.primary],

            secondary: [COLOR_SET.secondary],

            tertiary: [COLOR_SET.tertiary],
            tertiary_outlined: [COLOR_SET.tertiary_outlined],

            quaternary: [COLOR_SET.quaternary],
            quaternary_accent_outlined: [COLOR_SET.quaternary_accent_outlined],

            basic: [COLOR_SET.basic],
            basic_accent: [COLOR_SET.basic_accent],

            alert: [COLOR_SET.alert],
        },
        size: {
            xs: "rounded-lg typo-body-14-medium py-2 px-3",
            sm: "rounded-2xl typo-body-18-semibold py-3 px-4 min-w-20",
            md: "rounded-2xl typo-body-16-semibold w-full py-4 px-5",
            lg: "rounded-2xl typo-body-16-medium w-full py-5 px-10",
        },
    },
});
