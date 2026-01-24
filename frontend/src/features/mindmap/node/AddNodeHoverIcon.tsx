import IcIconMove from "@icons/ic_tool_move.svg?react";
import { ComponentPropsWithoutRef } from "react";
import { cn } from "@utils/cn";
import { getNodeColorClass, NodeColor } from "@utils/colors";

type Props = ComponentPropsWithoutRef<"button"> & { color: NodeColor };

export default function AddNodeHoverIcon({ color, ...rest }: Props) {
    const handleAddNode = () => {
        //TODO: menu 컴포넌트 생성
    };

    return (
        <button
            onClick={handleAddNode}
            className={cn(
                "w-13.5 h-13.5 rounded-full flex items-center justify-center shrink-0 cursor-pointer",
                getNodeColorClass({ color, opacity: 15 }), //TODO: size에 따라 변동 추후 개발
            )}
            {...rest}
        >
            <div
                className={cn(
                    "w-11 h-11 rounded-full border-base-white border-3 flex items-center justify-center shrink-0",
                    getNodeColorClass({ color }),
                )}
            >
                <IcIconMove className="w-5 h-6 text-base-white rotate-135" />
            </div>
        </button>
    );
}
