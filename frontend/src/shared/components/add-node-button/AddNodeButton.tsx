import { cn } from "@utils/cn";
import IcIconMove from "@icons/ic_tool_move.svg?react";

const NODE_COLORS = ["violet", "blue", "skyblue", "mint", "cyan", "purple", "magenta", "navy"] as const;

const getColorClass = (colorIndex: number) => {
    const index = colorIndex % NODE_COLORS.length;
    return `bg-node-${NODE_COLORS[index]}-op-100`;
};

const MoveIcon = () => (
    <div className="w-13.5 h-13.5 bg-node-violet-op-15 rounded-full flex items-center justify-center">
        <div className="w-11 h-11 bg-node-violet-op-100 rounded-full border-base-white border-3 flex items-center justify-center">
            <IcIconMove className="w-5 h-6 text-base-white rotate-135" />
        </div>
    </div>
);

type AddNodeButtonProps = {
    colorIndex?: number;
    className?: string;
};
const AddNodeButton = ({ colorIndex = 0, className }: AddNodeButtonProps) => {
    return (
        <button
            className={cn(
                "group relative flex items-center justify-center w-3 h-3 rounded-full cursor-pointer",
                getColorClass(colorIndex),
                className,
            )}
        >
            <div
                className="absolute inset-0 flex items-center justify-center
                            opacity-0 group-hover:opacity-100 
                            transition-all duration-300 ease-in-out"
            >
                <div className="z-10">
                    <MoveIcon />
                </div>
            </div>
        </button>
    );
};

export default AddNodeButton;
