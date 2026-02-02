// features/mindmap/utils/TreeLayoutManager.ts
import { NodeId } from "@/features/mindmap/types/mindmapType";
import NodeContainer from "@/features/mindmap/utils/nodeContainer";

interface LayoutConfig {
    gapX: number;
    gapY: number;
}

export default class TreeLayoutManager {
    private nodeContainer: NodeContainer;
    private config: LayoutConfig;
    private subtreeHeightMap: Map<NodeId, number> = new Map();

    constructor(nodeContainer: NodeContainer, config: LayoutConfig = { gapX: 50, gapY: 20 }) {
        this.nodeContainer = nodeContainer;
        this.config = config;
    }
    public layout(rootId: NodeId) {
        this.subtreeHeightMap.clear();

        this.calculateSubtreeHeight(rootId);

        const rootNode = this.nodeContainer.safeGetNode(rootId);

        if (!rootNode) return;

        // [수정] rootNode.y를 믿지 말고, 고정된 상수를 사용하세요.

        // 예: 캔버스 중앙이나 특정 시작점

        const FIXED_ROOT_X = 100;

        const FIXED_ROOT_Y = 300;

        // Root의 높이가 변하더라도, Root의 "중심"을 300에 고정

        const startY = FIXED_ROOT_Y - (this.subtreeHeightMap.get(rootId) || rootNode.height) / 2;

        this.assignCoordinates(rootId, FIXED_ROOT_X, startY);
    }

    private calculateSubtreeHeight(nodeId: NodeId): number {
        const node = this.nodeContainer.safeGetNode(nodeId);
        if (!node) return 0;

        const childIds = this.nodeContainer.getChildIds(nodeId);

        if (childIds.length === 0) {
            this.subtreeHeightMap.set(nodeId, node.height);
            return node.height;
        }

        let childrenTotalHeight = 0;
        childIds.forEach((childId) => {
            childrenTotalHeight += this.calculateSubtreeHeight(childId);
        });

        childrenTotalHeight += (childIds.length - 1) * this.config.gapY;
        const subtreeHeight = Math.max(node.height, childrenTotalHeight);

        this.subtreeHeightMap.set(nodeId, subtreeHeight);
        return subtreeHeight;
    }

    private assignCoordinates(nodeId: NodeId, x: number, y: number) {
        const node = this.nodeContainer.safeGetNode(nodeId);
        if (!node) return;

        const subtreeHeight = this.subtreeHeightMap.get(nodeId) || node.height;

        // 계산된 좌표
        const newY = y + subtreeHeight / 2 - node.height / 2;
        const newX = x; // x는 보통 정수 단위로 떨어져서 오차가 적지만, 같이 처리해도 무방

        // [수정됨] 단순 !== 대신 오차 범위를 고려한 비교 수행
        const isXChanged = !isSame(node.x, newX);
        const isYChanged = !isSame(node.y, newY);

        if (isXChanged || isYChanged) {
            console.log(`[Layout Update] Node: ${node.id.slice(0, 4)}`);
            console.log(` - Y Change: ${node.y} -> ${newY}`);
            console.log(` - Diff: ${newY - node.y}`);

            this.nodeContainer.update({
                nodeId: node.id,
                newNodeData: { x: newX, y: newY },
            });
        }

        const childIds = this.nodeContainer.getChildIds(nodeId);
        if (childIds.length === 0) return;

        // 자식 배치 시작
        const childrenBlockHeight =
            childIds.reduce((acc, childId) => {
                return acc + (this.subtreeHeightMap.get(childId) || 0);
            }, 0) +
            (childIds.length - 1) * this.config.gapY;

        const myCenterY = newY + node.height / 2;
        let currentChildY = myCenterY - childrenBlockHeight / 2;
        const nextX = x + node.width + this.config.gapX;

        childIds.forEach((childId) => {
            const childSubtreeHeight = this.subtreeHeightMap.get(childId) || 0;

            // 자식에게 할당된 영역의 Top Y를 넘김
            this.assignCoordinates(childId, nextX, currentChildY);

            currentChildY += childSubtreeHeight + this.config.gapY;
        });
    }
}

const isSame = (a: number, b: number) => Math.abs(a - b) < 0.1;
