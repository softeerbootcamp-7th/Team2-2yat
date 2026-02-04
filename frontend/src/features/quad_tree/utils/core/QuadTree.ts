import { Point } from "@/features/quad_tree/types/point";
import { Rect } from "@/features/quad_tree/types/rect";

/**
 * QuadTree
 *  bounds: Quad 객체가 담당하는 영역
 *  points: 현재 Quad에 저장된 노드
 *  limit: bounds에 저장할 수 있는 최대 노드 수
 *  children: 자식 쿼드
 */
export default class QuadTree {
    private bounds: Rect;
    private points: Point[] = [];
    private limit: number;
    private children: {
        NW: QuadTree;
        NE: QuadTree;
        SW: QuadTree;
        SE: QuadTree;
    } | null = null;

    constructor(bounds: Rect, limit: number) {
        this.bounds = bounds;
        this.limit = limit;
    }

    split() {
        const { minX, maxX, minY, maxY } = this.bounds;

        const midY = (minY + maxY) / 2;
        const midX = (minX + maxX) / 2;

        const nwBounds: Rect = { minX, maxX: midX, minY, maxY: midY };
        const neBounds: Rect = { minX: midX, maxX, minY, maxY: midY };
        const swBounds: Rect = { minX, maxX: midX, minY: midY, maxY };
        const seBounds: Rect = { minX: midX, maxX, minY: midY, maxY };

        this.children = {
            NW: new QuadTree(nwBounds, this.limit),
            NE: new QuadTree(neBounds, this.limit),
            SW: new QuadTree(swBounds, this.limit),
            SE: new QuadTree(seBounds, this.limit),
        };
    }
}
