import { ComponentPropsWithoutRef, useState } from "react";
import AddNode from "@features/mindmap/node/add_node/AddNode";

type Props = ComponentPropsWithoutRef<"div"> & {
    username?: string;
};

const PRIMARY_COLOR = "violet";

export default function NodeCenter({ username = "", className, ...rest }: Props) {
    const [isHover, setIsHover] = useState(false);
    const label = username ? `${username}의\n마인드맵` : "마인드맵";

    return (
        <div
            className={`group flex items-center gap-2 ${className ?? ""}`}
            onMouseEnter={() => setIsHover(true)}
            onMouseLeave={() => setIsHover(false)}
            {...rest}
        >
            {isHover && <AddNode color={PRIMARY_COLOR} direction="left" />}
            <div className="cursor-pointer w-40 bg-primary rounded-full h-40 flex items-center justify-center text-white typo-body-16-semibold px-3 whitespace-pre-line">
                {label}
            </div>
            {isHover && <AddNode color={PRIMARY_COLOR} direction="right" />}
        </div>
    );
}
