import findParentDOMByClass from "@utils/findParentDOMByClass";
import { RefObject, useLayoutEffect, useState } from "react";

export const BASE_DIRECTIONS = ["top", "bottom", "left", "right"] as const;
export type BaseDirection = (typeof BASE_DIRECTIONS)[number];
export type Direction =
    | "bottom_right"
    | "bottom_left"
    | "top_right"
    | "top_left"
    | "right_top"
    | "right_bottom"
    | "left_top"
    | "left_bottom"
    | BaseDirection;

const OPPOSITE: Record<BaseDirection, BaseDirection> = {
    top: "bottom",
    bottom: "top",
    left: "right",
    right: "left",
};

type Props = {
    triggerRef: RefObject<HTMLDivElement | null>;
    contentsRef: RefObject<HTMLDivElement | null>;
    disabled?: boolean;
    direction: Direction;
};

const useCalcSafeDirection = ({ disabled = false, direction, triggerRef, contentsRef }: Props) => {
    const [safeDirection, setSafeDirection] = useState<Direction>(direction);

    useLayoutEffect(() => {
        const trigger = triggerRef.current;
        const contents = contentsRef.current;

        if (disabled || !trigger || !contents) {
            return;
        }

        const parent =
            findParentDOMByClass({ startDOM: trigger, className: "overflow-hidden" }) || document.documentElement;
        const parentRect = parent.getBoundingClientRect();
        const triggerRect = trigger.getBoundingClientRect();
        const contentsRect = contents.getBoundingClientRect();

        // 남은 공간
        const remainingSpace = {
            top: triggerRect.top - parentRect.top,
            bottom: parentRect.bottom - triggerRect.bottom,
            left: triggerRect.left - parentRect.left,
            right: parentRect.right - triggerRect.right,
        };

        // 바로 다음, 다다음 라인에서 유효성 검사 후 valid값 주입하므로(타입가드처럼) as를 사용했습니다.
        const [primaryDirection, secondaryDirection] = direction.split("_") as BaseDirection[];
        const safePrimaryDirection = calcSafeDirection({
            direction: primaryDirection || "bottom",
            remainingSpace,
            parentRect,
            contentsRect,
        });
        const safeSecondaryDirection = calcSafeDirection({
            direction: secondaryDirection,
            remainingSpace,
            parentRect,
            contentsRect,
        });

        // 안전한 방향을 결정
        const filteredDirection = [safePrimaryDirection, safeSecondaryDirection].filter((v) => v !== undefined);
        const joinedDirection = filteredDirection.join("_");
        const nextDirection = isDirection(joinedDirection) ? joinedDirection : "bottom";

        setSafeDirection(nextDirection);
    }, [disabled, direction]);

    return { safeDirection };
};

export default useCalcSafeDirection;

function isDirection(direction: string): direction is Direction {
    const [primary, secondary] = direction.split("_");

    if (primary) {
        if (secondary && secondary !== primary) {
            return true;
        }

        if (!secondary) {
            return true;
        }

        return false;
    }

    return false;
}

function isOverflowing({
    direction,
    contentsRect,
    parentRect,
}: {
    direction: BaseDirection;
    contentsRect: DOMRect;
    parentRect: DOMRect;
}) {
    if (direction === "top") return contentsRect.top < parentRect.top;
    if (direction === "bottom") return contentsRect.bottom > parentRect.bottom;
    if (direction === "left") return contentsRect.left < parentRect.left;
    if (direction === "right") return contentsRect.right > parentRect.right;

    return false;
}

type CardinalDirection = {
    top: number;
    bottom: number;
    left: number;
    right: number;
};

const calcSafeDirection = ({
    direction,
    contentsRect,
    parentRect,
    remainingSpace,
}: {
    direction: BaseDirection | undefined;
    contentsRect: DOMRect;
    parentRect: DOMRect;
    remainingSpace: CardinalDirection;
}): BaseDirection | undefined => {
    const isVertical = direction === "top" || direction === "bottom";
    const targetSize = isVertical ? contentsRect.height : contentsRect.width;

    if (direction === undefined) {
        let safeDirection: BaseDirection | undefined = direction;

        BASE_DIRECTIONS.forEach((curDirection) => {
            if (isOverflowing({ direction: curDirection, contentsRect, parentRect })) {
                safeDirection = OPPOSITE[curDirection];
            }
        });

        return safeDirection;
    }

    if (remainingSpace[direction] >= targetSize) {
        return direction;
    } else {
        return OPPOSITE[direction];
    }
};
