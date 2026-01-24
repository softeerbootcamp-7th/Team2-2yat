import { cn } from "@utils/cn";
import { ComponentPropsWithoutRef, ReactNode } from "react";

type Props = ComponentPropsWithoutRef<"li"> & {
    leftSlot?: ReactNode;
    contents?: ReactNode;
    rightSlot?: ReactNode;
};

const ListRow = ({ leftSlot, contents, rightSlot, className, ...rest }: Props) => {
    return (
        <li
            className={cn(
                "flex flex-row justify-between text-base-navy whitespace-nowrap hover:bg-cobalt-100 typo-body-14-regular",
                className,
            )}
            {...rest}
        >
            <div className="flex flex-row gap-2 items-center">
                {leftSlot && leftSlot}

                {contents}
            </div>

            {rightSlot && rightSlot}
        </li>
    );
};

export default ListRow;
