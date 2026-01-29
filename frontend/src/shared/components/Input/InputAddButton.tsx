import Icon from "@shared/components/icon/Icon";
import { cn } from "@utils/cn";
import { ComponentPropsWithoutRef } from "react";

type Props = ComponentPropsWithoutRef<"button"> & {};

export default function InputAddButton({ children, className, ...rest }: Props) {
    return (
        <button
            {...rest}
            className={cn(
                "w-full h-12 flex items-center justify-center gap-2 typo-body-14-medium cursor-pointer bg-base-white border-2 border-dashed border-gray-300 rounded-xl text-text-placeholder",
                className,
            )}
        >
            <Icon name="ic_plus" size={18} />
            {children || "에피소드 추가"}
        </button>
    );
}
