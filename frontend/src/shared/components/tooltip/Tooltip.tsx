import useToggle from "@shared/hooks/useToggle";
import { ReactNode } from "react";

type Props = {
    children: ReactNode;
    contents: ReactNode;

    direction?: "top" | "bottom" | "left" | "right";
};

const Tooltip = ({ direction = "right", children, contents }: Props) => {
    const [isVisible, { setOff, setOn }] = useToggle();

    return (
        <div onPointerOver={setOn} onPointerLeave={setOff} className="relative w-fit">
            {children}

            {isVisible && <div className={`absolute z-50 ${positionClasses[direction]}`}>{contents}</div>}
        </div>
    );
};

export default Tooltip;

const positionClasses = {
    top: "bottom-full left-1/2 -translate-x-1/2 mb-2",
    bottom: "top-full left-1/2 -translate-x-1/2 mt-2",
    left: "right-full top-1/2 -translate-y-1/2 mr-2",
    right: "left-full top-1/2 -translate-y-1/2 ml-2",
};
