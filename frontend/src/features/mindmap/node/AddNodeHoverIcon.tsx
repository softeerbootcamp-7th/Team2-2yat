import IcIconMove from "@icons/ic_tool_move.svg?react";

export default function AddNodeHoverIcon() {
    return (
        <div className="w-13.5 h-13.5 bg-node-violet-op-15 rounded-full flex items-center justify-center">
            <div className="w-11 h-11 bg-node-violet-op-100 rounded-full border-base-white border-3 flex items-center justify-center">
                <IcIconMove className="w-5 h-6 text-base-white rotate-135" />
            </div>
        </div>
    );
}
