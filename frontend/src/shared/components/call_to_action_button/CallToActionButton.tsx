import { COLOR_SET } from "@shared/styles/color_set";
import { cva, VariantProps } from "class-variance-authority";
import { ComponentPropsWithoutRef, ReactNode } from "react";
import Icon from "@shared/components/icon/Icon";
import { cn } from "@utils/cn";

type Props = ComponentPropsWithoutRef<"button"> &
    VariantProps<typeof variants> & {
        variant?: "primary" | "primary_accent" | "quaternary_accent_outlined";
    };

const CallToActionButton = ({ variant = "primary", className, children }: Props) => {
    return (
        <button className={cn(variants({ variant }), className)}>
            {children}

            <div className="bg-white rounded-sm p-2">
                <Icon name="ic_arrow_right" color="black" size="14" strokeWidth={2} />
            </div>
        </button>
    );
};

const variants = cva(
    "py-2 pr-2 pl-5 typo-body-16-medium flex flex-row items-center gap-4 rounded-lg shadow-[0_0_10px_0_rgba(111,128,255,0.30)]",
    {
        variants: {
            variant: {
                primary: [COLOR_SET.primary, "[&_svg]:text-black", "[&_div]:bg-white"],
                primary_accent: [COLOR_SET.primary_accent, "[&_svg]:text-black", "[&_div]:bg-white"],
                quaternary_accent_outlined: [
                    COLOR_SET.quaternary_accent_outlined,
                    "[&_svg]:text-white",
                    "[&_div]:bg-primary",
                ],
            },
        },
    },
);

export default CallToActionButton;
