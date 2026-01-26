import { cn } from "@utils/cn";
import { cva, VariantProps } from "class-variance-authority";
import { ComponentPropsWithoutRef, ReactNode } from "react";

type Props = ComponentPropsWithoutRef<"div"> &
    VariantProps<typeof variants> & {
        header?: ReactNode;
        contents?: ReactNode;
        bottomContents?: ReactNode;
        footer?: ReactNode;
    };

const Card = ({
    gap = "md",
    yPadding = "md",
    xPadding = "lg",
    header,
    bottomContents,
    contents,
    footer,
    className,
    ...rest
}: Props) => {
    return (
        <div className={cn(variants({ yPadding, xPadding, gap }), className)} {...rest}>
            <div className="flex flex-col gap-2 h-fit">
                {header}

                {contents}
            </div>

            <div className="flex flex-col gap-2 h-fit">
                {bottomContents}

                {footer}
            </div>
        </div>
    );
};

export default Card;

const variants = cva(
    "text-gray-800 w-full h-full flex flex-col space-between bg-white outline outline-gray-400 rounded-xl hover:outline-primary hover:outline-2 hover:shadow-lg",
    {
        variants: {
            yPadding: {
                sm: "py-3",
                md: "py-4",
                lg: "py-6",
            },
            xPadding: {
                sm: "px-3",
                md: "px-4",
                lg: "px-6",
            },
            gap: {
                sm: "gap-1",
                md: "gap-2",
                lg: "gap-3",
            },
        },
    },
);
