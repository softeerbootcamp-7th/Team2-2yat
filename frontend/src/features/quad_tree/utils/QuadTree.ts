import { Point } from "@/features/quad_tree/types/point";
import { Rect } from "@/features/quad_tree/types/rect";
import { isIntersected, isPointInRect } from "@/shared/utils/rect_helper";

/**
 * QuadTree
 *  bounds: Quad 객체가 담당하는 영역
 *  points: 현재 Quad에 저장된 점
 *  limit: bounds에 저장할 수 있는 최대 노드 수
 *  children: 자식 쿼드
 */
export default class QuadTree {
    private bounds: Rect;
    private points: Set<Point> = new Set();
    private limit: number;
    private children: {
        NW: QuadTree;
        NE: QuadTree;
        SW: QuadTree;
        SE: QuadTree;
    } | null = null;

    constructor(bounds: Rect, limit: number = 4) {
        this.bounds = bounds;
        this.limit = limit;
    }

    /** [Add/Drop] 점 삽입: 개수 > limit 이면, 하위 영역으로 분할하고 자식 노드로 전달 */
    insert(point: Point): boolean {
        // 삽입하려는 점이 현재 Quad 영역에 속하지 않으면 삽입 거부
        if (!this.isPointInBounds(point)) {
            console.error(`[QuadTree 삽입 실패] 점 (${point.x}, ${point.y})이 경계 영역 밖에 있습니다.`);
            return false;
        }

        // 이미 분할된 상태라면 자식 노드에게 삽입 위임
        if (this.children) {
            const success = this.delegateInsert(point);
            if (!success) {
                console.warn(`[QuadTree] 자식 노드 위임 실패: (${point.x}, ${point.y}) 점을 수용할 자식이 없습니다.`);
            }
            return success;
        }

        // 현재 노드에 여유 공간이 있으면 점을 직접 추가
        if (this.points.size < this.limit) {
            this.points.add(point);
            return true;
        }

        // 용량 초과 시 영역을 4개로 분할하고 기존 점들을 자식 노드로 재배치
        this.split();
        this.moveToChild();

        // 새로 들어온 점도 자식 노드로 위임
        return this.delegateInsert(point);
    }

    /** [Remove/DragStart] 점 삭제 : 삭제 후 데이터 밀도가 낮아지면 tryMerge */
    remove(point: Point): boolean {
        if (!this.isPointInBounds(point)) {
            console.error(`[QuadTree 삽입 실패] 점 (${point.x}, ${point.y})이 경계 영역 밖에 있습니다.`);
            return false;
        }

        let removed = false;

        if (this.children) {
            removed = this.delegateRemove(point);

            if (removed) {
                this.tryMerge();
            } else {
                // 삭제 대상이 영역 안에는 있어야 하는데 못 찾은 경우
                console.error(
                    `[QuadTree 삭제 실패] 하위 자식 노드에서 점 (${point.x}, ${point.y})을 찾을 수 없습니다.`,
                );
            }
        } else {
            // 리프 노드인 경우 직접 점 삭제
            removed = this.points.delete(point);
            if (!removed) {
                console.error(`[QuadTree 삭제 실패] 리프 노드에 삭제하려는 점 (${point.x}, ${point.y})이 없습니다.`);
            }
        }
        return removed;
    }

    /**[DragMove] 범위 탐색 : 마우스 주변의 스냅 가능한 노드 확보 */
    getPointsInRange(range: Rect, found: Point[] = []): Point[] {
        if (!isIntersected(this.bounds, range)) {
            return found;
        }

        this.points.forEach((point) => {
            if (isPointInRect(point, range)) {
                found.push(point);
            }
        });

        if (this.children) {
            this.children.NW.getPointsInRange(range, found);
            this.children.NE.getPointsInRange(range, found);
            this.children.SW.getPointsInRange(range, found);
            this.children.SE.getPointsInRange(range, found);
        }
        return found;
    }

    /** 현재 영역을 4개의 하위 영역으로 분할 */
    private split() {
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

    /** 하위 노드들의 점 개수 합 <= limit 이하일 경우, 부모 노드로 병합 */
    private tryMerge() {
        if (!this.children) {
            return;
        }

        const totalPoints = this.countAllPoints();

        if (totalPoints <= this.limit) {
            this.collectAllPoints(this.points);
            this.children = null; // 자식 Quad 연결 해제
        }
    }

    /** 해당 점이 현재 Quad의 영역 내에 포함되는지 확인 */
    private isPointInBounds(point: Point) {
        return isPointInRect(point, this.bounds);
    }

    /** 현재 노드 이하의 총 노드 개수 반환 */
    private countAllPoints(): number {
        if (!this.children) {
            return this.points.size;
        }

        const { NW, NE, SW, SE } = this.children;
        return NW.countAllPoints() + NE.countAllPoints() + SW.countAllPoints() + SE.countAllPoints();
    }

    /** 자식 노드들에 흩어진 모든 점을 하나의 Set으로 수집 */
    private collectAllPoints(points: Set<Point>) {
        if (!this.children) {
            this.points.forEach((point) => points.add(point));
            return;
        }

        const { NW, NE, SW, SE } = this.children;
        NW.collectAllPoints(points);
        NE.collectAllPoints(points);
        SW.collectAllPoints(points);
        SE.collectAllPoints(points);
    }

    /** 현재 노드가 보유한 점들을 자식 노드로 이동시킨 후 현재 목록 비우기 */
    private moveToChild() {
        this.points.forEach((point) => this.delegateInsert(point));
        this.points.clear();
    }

    /** 삽입 작업을 자식 노드에게 위임 */
    private delegateInsert(point: Point): boolean {
        if (!this.children) {
            console.error("[QuadTree 위임 실패] 자식 노드가 생성되지 않은 상태입니다.");
            return false;
        }
        const { NW, NE, SW, SE } = this.children;

        return NW.insert(point) || NE.insert(point) || SW.insert(point) || SE.insert(point);
    }

    /** 삭제 작업을 자식 노드에게 위임 */
    private delegateRemove(point: Point): boolean {
        if (!this.children) {
            console.error("[QuadTree 위임 실패] 삭제를 위임할 자식 노드가 존재하지 않습니다.");
            return false;
        }
        const { NW, NE, SW, SE } = this.children;

        return NW.remove(point) || NE.remove(point) || SW.remove(point) || SE.remove(point);
    }
}
