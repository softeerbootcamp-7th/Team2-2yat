import { type NodeComponentProps } from "@features/mindmap/node/types/node";
import { useState } from "react";
import AddNodeDot from "@features/mindmap/node/add_node/AddNodeDot";
import AddNodeArrow from "@features/mindmap/node/add_node/AddNodeArrow";

export default function AddNodeButton({ color }: NodeComponentProps) {
    const [isHovered, setIsHovered] = useState(false);

    return (
        <button
            onMouseEnter={() => setIsHovered(true)}
            onMouseLeave={() => setIsHovered(false)}
            className="relative w-13.5 h-13.5 flex items-center justify-center"
        >
            <div className={`transition-opacity duration-300 ${isHovered ? "opacity-0" : "opacity-100"}`}>
                <AddNodeDot color={color} />
            </div>
            <div
                className={`absolute inset-0 flex items-center justify-center transition-opacity duration-300 ${isHovered ? "opacity-100" : "opacity-0"}`}
            >
                <AddNodeArrow color={color} />
            </div>
        </button>
    );
}
