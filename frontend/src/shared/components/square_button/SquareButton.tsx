import { ComponentPropsWithoutRef } from "react";

type Props = ComponentPropsWithoutRef<"button"> & {};

const SquareButton = ({ children, ...rest }: Props) => {
    return (
        <button
            className="flex justify-center items-center h-9 w-9 bg-white outline-1 outline-gray-200 rounded-[10px] shadow-lg text-base-navy"
            {...rest}
        >
            {children}
        </button>
    );
};

export default SquareButton;
