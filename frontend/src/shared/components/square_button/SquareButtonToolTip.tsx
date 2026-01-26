import { ComponentPropsWithoutRef } from "react";

type Props = ComponentPropsWithoutRef<"div"> & {};

const SquareButtonToolTip = ({ children, ...rest }: Props) => {
    return (
        <div
            className="flex justify-center items-center h-9 px-3 whitespace-nowrap typo-body-14-regular bg-white rounded-[10px] shadow-lg text-gray-800"
            {...rest}
        >
            {children}
        </div>
    );
};

export default SquareButtonToolTip;
