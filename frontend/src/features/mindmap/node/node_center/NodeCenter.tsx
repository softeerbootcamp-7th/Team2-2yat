import AddNode from "@features/mindmap/node/add_node/AddNode";
import { ComponentPropsWithoutRef } from "react";

type Props = ComponentPropsWithoutRef<"div"> & {
    username?: string;
};

const PRIMARY_COLOR = "violet";

export default function NodeCenter({ username = "", className, ...rest }: Props) {
    const label = username ? `${username}의\n마인드맵` : "마인드맵";

    return (
        <div className={`group flex items-center gap-2 ${className ?? ""}`} {...rest}>
            <AddNode
                color={PRIMARY_COLOR}
                direction="left"
                className="opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none group-hover:pointer-events-auto"
            />
            <div className="cursor-pointer w-40 bg-node-violet-op-100 rounded-full h-40 flex items-center justify-center text-white typo-body-16-semibold px-3 whitespace-pre-line">
                {label}
            </div>
            <AddNode
                color={PRIMARY_COLOR}
                direction="right"
                className="opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none group-hover:pointer-events-auto"
            />
        </div>
    );
}
