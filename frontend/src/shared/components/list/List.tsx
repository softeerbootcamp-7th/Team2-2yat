import { cn } from "@utils/cn";
import { ComponentPropsWithRef } from "react";

type Props = ComponentPropsWithRef<"ul"> & {};

const List = ({ children, className, ...rest }: Props) => {
    return (
        <ul
            className={cn(
                "shadow-lg bg-white rounded-xl outline-[1.68px] outline-white flex flex-col w-fit overflow-hidden",
                className,
            )}
            {...rest}
        >
            {children}
        </ul>
    );
};

export default List;
