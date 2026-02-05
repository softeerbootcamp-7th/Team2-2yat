import { Point } from "@/features/quad_tree/types/point";
import { Rect } from "@/features/quad_tree/types/rect";

/** 특정 점이 지정된 사각형 영역 안에 포함되는지 확인 */
export const isPointInRect = (point: Point, rect: Rect): boolean => {
    return point.x >= rect.minX && point.x <= rect.maxX && point.y >= rect.minY && point.y <= rect.maxY;
};

/** 두 사각형 영역이 서로 겹치는지 확인  */
export const intersects = (rectA: Rect, rectB: Rect): boolean => {
    return !(rectB.minX > rectA.maxX || rectB.maxX < rectA.minX || rectB.minY > rectA.maxY || rectB.maxY < rectA.minY);
};
