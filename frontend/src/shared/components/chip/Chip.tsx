import { cva, VariantProps } from "class-variance-authority";
import { ComponentPropsWithoutRef, ReactNode } from "react";

import { COLOR_SET } from "@/shared/styles/color_set";
import { cn } from "@/utils/cn";

type AllowedElementType = "button" | "span";

type Props<T extends AllowedElementType> = ComponentPropsWithoutRef<T> &
    VariantProps<typeof variants> & {
        as?: T;
        leftSlot?: ReactNode;
    };

const Chip = <T extends AllowedElementType = "button">({
    variant = "primary",
    size = "md",
    leftSlot,
    className,
    children,
    as,
    ...rest
}: Props<T>) => {
    const Component = as ? as : "button";

    return (
        <Component className={cn(variants({ variant, size }), className)} {...rest}>
            {leftSlot ? leftSlot : null}

            {children}
        </Component>
    );
};

const variants = cva("rounded-4xl flex flex-row items-center", {
    variants: {
        variant: {
            primary: [COLOR_SET.primary],
            secondary: [COLOR_SET.secondary],
            tertiary: [COLOR_SET.tertiary],
            tertiary_outlined: [COLOR_SET.tertiary_outlined],
            quaternary: [COLOR_SET.quaternary],
            quaternary_accent_outlined: [COLOR_SET.quaternary_accent_outlined],
            basic: [COLOR_SET.basic],
            notification: [COLOR_SET.notification],
            alert: [COLOR_SET.alert],
        },
        size: {
            md: "typo-caption-14-medium py-2 px-3 h-9 gap-2",
            sm: "typo-caption-12-medium py-1 px-2.5 h-6 gap-1",
        },
    },
});

export default Chip;
