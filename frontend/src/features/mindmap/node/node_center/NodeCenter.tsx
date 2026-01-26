import { ComponentPropsWithoutRef, useState } from "react";
import AddNode from "@features/mindmap/node/add_node/AddNode";

type Props = ComponentPropsWithoutRef<"div"> & {
    username?: string;
};

export default function NodeCenter({ username = "", className, ...rest }: Props) {
    const [isHover, setIsHover] = useState(false);
    const label = username ? `${username}의 마인드맵` : "마인드맵";

    return (
        <div
            className={`group flex items-center gap-2 ${className ?? ""}`}
            onMouseEnter={() => setIsHover(true)}
            onMouseLeave={() => setIsHover(false)}
            {...rest}
        >
            {isHover && <AddNode color="violet" />}
            <div className="cursor-pointer w-40 bg-primary rounded-full h-40 flex items-center justify-center text-white typo-body-16-semibold px-3 text-center leading-tight">
                {label}
            </div>
            {isHover && <AddNode color="violet" />}
        </div>
    );
}
