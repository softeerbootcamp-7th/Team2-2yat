import { cva, VariantProps } from "class-variance-authority";
import { ComponentPropsWithoutRef, ReactNode } from "react";

import { cn } from "@/utils/cn";

type Props = Omit<ComponentPropsWithoutRef<"div">, "title"> &
    VariantProps<typeof variants> &
    VariantProps<typeof titleVariants> & {
        title?: ReactNode;
        lower?: ReactNode;
        upper?: ReactNode;
    };

const Top = ({
    align = "left",
    lowerGap = "none",
    upperGap = "none",
    title,
    lower,
    upper,
    className,
    ...rest
}: Props) => {
    return (
        <div className={cn(variants({ align }), className)}>
            {upper}

            <div className={cn(titleVariants({ lowerGap, upperGap }), className)} {...rest}>
                {title}
            </div>

            {lower}
        </div>
    );
};

export default Top;

const variants = cva("flex flex-col", {
    variants: {
        align: {
            center: "items-center",
            left: "items-start",
            right: "items-end",
        },
    },
});

const titleVariants = cva("", {
    variants: {
        upperGap: {
            none: "",
            sm: "mt-2",
            md: "mt-3",
            lg: "mt-4",
        },
        lowerGap: {
            none: "",
            sm: "mb-2",
            md: "mb-3",
            lg: "mb-4",
        },
    },
});
