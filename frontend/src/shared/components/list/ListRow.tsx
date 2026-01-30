import { ComponentPropsWithoutRef, ReactNode } from "react";

import { cn } from "@/utils/cn";

type Variant = "default" | "alert";
type Props = ComponentPropsWithoutRef<"li"> & {
    leftSlot?: ReactNode;
    contents?: ReactNode;
    rightSlot?: ReactNode;
    variant?: Variant;
};

const ListRow = ({ variant = "default", leftSlot, contents, rightSlot, className, ...rest }: Props) => {
    return (
        <li
            className={cn(
                `${variantStyles[variant]} rounded-xl px-3 py-2 flex flex-row justify-between items-center whitespace-nowrap hover:bg-cobalt-100 typo-body-14-regular`,
                className,
            )}
            {...rest}
        >
            <div className="flex flex-row gap-2 items-center">
                {leftSlot}

                {contents}
            </div>

            {rightSlot}
        </li>
    );
};

export default ListRow;

const variantStyles: Record<Variant, string> = {
    default: "text-base-navy hover:text-primary",
    alert: "text-red-300",
};
