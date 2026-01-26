import { cn } from "@utils/cn";
import { Children, ComponentPropsWithoutRef, Fragment } from "react";
import Divider from "@shared/components/divider/Divider";

type Props = ComponentPropsWithoutRef<"ul"> & {
    hasDivider?: boolean;
};

const List = ({ hasDivider = true, children, className, ...rest }: Props) => {
    const childrenArray = Children.toArray(children);

    return (
        <ul
            className={cn(
                "shadow-lg bg-white rounded-xl outline-[1.68px] outline-white flex flex-col w-fit",
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
