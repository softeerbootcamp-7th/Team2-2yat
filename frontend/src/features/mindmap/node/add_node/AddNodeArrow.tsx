import IcIconMove from "@icons/ic_tool_move.svg?react";
import { cn } from "@utils/cn";
import { getNodeColorClass, NodeColor } from "@features/mindmap/node/constants/colors";

export default function AddNodeArrow({ color }: { color: NodeColor }) {
    const handleAddNode = () => {
        // TODO: menu 컴포넌트 생성
    };

    const centerClass = "flex items-center justify-center rounded-full";

    const outerCircleClass = cn("w-13.5 h-13.5 cursor-pointer", centerClass, getNodeColorClass({ color, opacity: 15 }));
    const iconCircleClass = cn("w-11 h-11 border-base-white border-3", centerClass, getNodeColorClass({ color }));

    return (
        <button onClick={handleAddNode} className={outerCircleClass}>
            <div className={iconCircleClass}>
                <IcIconMove className="w-5 h-6 text-base-white rotate-135" />
            </div>
        </button>
    );
}
