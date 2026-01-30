import { cva } from "class-variance-authority";
import { ReactNode, useRef } from "react";

import useCalcSafeDirection from "@/shared/hooks/useCalcSafeDirection";
import useToggle from "@/shared/hooks/useToggle";
import { SafeVariantProps } from "@/shared/types/safe_variant_props";

type Props = SafeVariantProps<typeof variants> & {
    children: ReactNode;
    contents: ReactNode;
};

const Popover = ({ direction = "bottom_left", children, contents }: Props) => {
    const triggerRef = useRef<HTMLDivElement>(null);
    const contentsRef = useRef<HTMLDivElement>(null);

    const [isVisible, isVisibleHandler] = useToggle();

    const { safeDirection } = useCalcSafeDirection({
        direction,
        triggerRef,
        contentsRef,
        disabled: !isVisible,
    });

    return (
        <div ref={triggerRef} className="relative w-fit">
            <div onClick={isVisibleHandler.toggle}>{children}</div>

            {isVisible && (
                <div ref={contentsRef} className={variants({ direction: safeDirection })}>
                    {contents}
                </div>
            )}
        </div>
    );
};

export default Popover;

const variants = cva("absolute z-50", {
    variants: {
        direction: {
            top: "bottom-full left-1/2 -translate-x-1/2 mb-2",
            top_left: "bottom-full right-0 mb-2",
            top_right: "bottom-full left-0 mb-2",
            bottom: "top-full left-1/2 -translate-x-1/2 mt-2",
            bottom_left: "top-full right-0 mt-2",
            bottom_right: "top-full left-0 mt-2",
            left: "right-full top-1/2 -translate-y-1/2 mr-2",
            left_top: "right-full bottom-0 mr-2",
            left_bottom: "right-full top-0 mr-2",
            right: "left-full top-1/2 -translate-y-1/2 ml-2",
            right_top: "left-full bottom-0 ml-2",
            right_bottom: "left-full top-0 ml-2",
        },
    },
});

/**
 * 1. 클릭된다.
 * 2. 오버플로우히든인 래퍼를 찾는다.
 * 3. 디렉션에 따라 trigger, contents의 바운딩 박스가 래퍼를 벗어나는지 확인한다.
 * 4. 벗어난다면 해당 벗어난 위치에 mirror위치로 이동시켜 렌더링한다.
 */
