import { cn } from "@utils/cn";
import { Children, ComponentPropsWithoutRef, Fragment } from "react";
import Divider from "@shared/components/divider/Divider";

type Props = ComponentPropsWithoutRef<"ul"> & {
    hasDivider?: boolean;
    width?: "fit" | "full";
};

const List = ({ hasDivider = true, width = "fit", children, className, ...rest }: Props) => {
    const childrenArray = Children.toArray(children);

    return (
        <ul
            className={cn(
                "shadow-lg bg-white rounded-xl flex flex-col overflow-hidden",
                width === "fit" ? "w-fit" : "w-full",
                className,
            )}
            {...rest}
        >
            {childrenArray.map((child, index) => (
                <Fragment key={index}>
                    {hasDivider && <Divider direction="x" className="first:hidden" />}

                    {child}
                </Fragment>
            ))}
        </ul>
    );
};

export default List;
