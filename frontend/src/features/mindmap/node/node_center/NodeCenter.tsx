import { useState } from "react";
import AddNodeButton from "@features/mindmap/node/add_node/AddNodeButton";

export default function NodeCenter() {
    const [isHover, setIsHover] = useState(false);
    return (
        <div
            className="group flex items-center gap-2"
            onMouseEnter={() => setIsHover(true)}
            onMouseLeave={() => setIsHover(false)}
        >
            {isHover && <AddNodeButton color="violet" />}
            <div className="cursor-pointer w-40 bg-primary rounded-full h-40 flex items-center justify-center text-white typo-body-16-semibold">
                sdfsd
            </div>
            {isHover && <AddNodeButton color="violet" />}
        </div>
    );
}
