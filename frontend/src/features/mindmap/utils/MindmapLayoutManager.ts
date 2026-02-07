import { NodeElement, NodeId } from "@/features/mindmap/types/mindmapType";
import TreeContainer from "@/features/mindmap/utils/TreeContainer";
import { CacheMap } from "@/utils/CacheMap";
import { calcPartitionIndex } from "@/utils/calc_partition";
import { isSame } from "@/utils/is_same";

type LayoutConfig = {
    xGap: number;
    yGap: number;
};

type PartitionDirection = "right" | "left";

export default class MindmapLayoutManager {
    private treeContainer: TreeContainer;
    private config: LayoutConfig;
    private subtreeHeightCache: CacheMap<NodeId, number>;

    constructor({ treeContainer, config = {} }: { treeContainer: TreeContainer; config?: Partial<LayoutConfig> }) {
        const defaultConfig: LayoutConfig = {
            xGap: 100,
            yGap: 16,
        };

        this.treeContainer = treeContainer;
        this.config = { ...defaultConfig, ...config };
        this.subtreeHeightCache = new CacheMap(0);
    }

    public invalidate(nodeId: NodeId) {
        let currentId: NodeId | undefined = nodeId;

        while (currentId) {
            this.subtreeHeightCache.delete(currentId);

            const parentNode = this.treeContainer.safeGetParentNode(currentId);
            if (!parentNode) {
                break;
            }

            currentId = parentNode.id;
        }
    }

    public updateLayout({
        rootId,
        rootCenterX = 0,
        rootCenterY = 0,
    }: {
        rootId: NodeId;
        rootCenterX?: number;
        rootCenterY?: number;
    }) {
        const rootNode = this.treeContainer.safeGetNode(rootId);
        if (!rootNode) {
            return;
        }

        const realX = rootCenterX - rootNode.width / 2;
        const realY = rootCenterY - rootNode.height / 2;

        this.treeContainer.update({
            nodeId: rootId,
            newNodeData: { x: realX, y: realY },
        });

        const childNodes = this.treeContainer.getChildNodes(rootId);
        if (childNodes.length === 0) {
            return;
        }

        const { leftGroup, rightGroup } = this.getPartition(childNodes);

        this.calcPartitionCoords({
            parentNode: rootNode,
            partition: rightGroup,
            parentRealX: realX,
            parentRealY: realY,
            direction: "right",
        });

        this.calcPartitionCoords({
            parentNode: rootNode,
            partition: leftGroup,
            parentRealX: realX,
            parentRealY: realY,
            direction: "left",
        });
    }

    private getPartition(childNodes: NodeElement[]) {
        const heightArr = childNodes.map((node) => this.getSubTreeHeight(node));
        const partitionIndex = calcPartitionIndex(heightArr);

        return {
            rightGroup: childNodes.slice(0, partitionIndex),
            leftGroup: childNodes.slice(partitionIndex),
        };
    }

    private getSubTreeHeight(node: NodeElement): number {
        if (this.subtreeHeightCache.has(node.id)) {
            return this.subtreeHeightCache.get(node.id);
        }

        const childNodes = this.treeContainer.getChildNodes(node.id);
        let calculatedHeight = 0;

        if (childNodes.length === 0) {
            calculatedHeight = node.height;
        } else {
            const gapHeight = (childNodes.length - 1) * this.config.yGap;
            const childrenHeightSum = childNodes.reduce((acc, child) => acc + this.getSubTreeHeight(child), gapHeight);

            calculatedHeight = Math.max(node.height, childrenHeightSum);
        }

        this.subtreeHeightCache.set(node.id, calculatedHeight);
        return calculatedHeight;
    }

    private calcPartitionCoords({
        parentNode,
        partition,
        parentRealX,
        parentRealY,
        direction,
    }: {
        parentNode: NodeElement;
        partition: NodeElement[];
        parentRealX: number;
        parentRealY: number;
        direction: PartitionDirection;
    }) {
        if (partition.length === 0) {
            return;
        }

        const partitionHeight = this.calcPartitionHeightWithGap(partition);
        let currentY = parentRealY + parentNode.height / 2 - partitionHeight / 2;

        partition.forEach((childNode) => {
            const realX =
                direction === "right"
                    ? parentRealX + parentNode.width + this.config.xGap
                    : parentRealX - childNode.width - this.config.xGap;

            this.assignCoordinates({ parentNode: childNode, x: realX, startY: currentY, direction });

            currentY += this.getSubTreeHeight(childNode) + this.config.yGap;
        });
    }

    private assignCoordinates({
        parentNode,
        x,
        startY,
        direction,
    }: {
        parentNode: NodeElement;
        x: number;
        startY: number;
        direction: PartitionDirection;
    }) {
        const subtreeHeight = this.getSubTreeHeight(parentNode);
        const newNodeY = startY - parentNode.height / 2 + subtreeHeight / 2;

        if (!isSame(parentNode.x, x) || !isSame(parentNode.y, newNodeY)) {
            this.treeContainer.update({
                nodeId: parentNode.id,
                newNodeData: { x, y: newNodeY },
            });
        }

        const childNodes = this.treeContainer.getChildNodes(parentNode.id);
        if (childNodes.length === 0) {
            return 0;
        }

        const childGroupHeight = this.calcPartitionHeightWithGap(childNodes);
        let currentChildY = newNodeY + parentNode.height / 2 - childGroupHeight / 2;

        childNodes.forEach((childNode) => {
            const nextX =
                direction === "right"
                    ? x + parentNode.width + this.config.xGap
                    : x - childNode.width - this.config.xGap;

            this.assignCoordinates({ parentNode: childNode, x: nextX, startY: currentChildY, direction });

            currentChildY += this.getSubTreeHeight(childNode) + this.config.yGap;
        });
    }

    private calcPartitionHeightWithGap(partition: NodeElement[]) {
        if (partition.length === 0) {
            return 0;
        }

        const totalGap = this.config.yGap * (partition.length - 1);
        const totalNodesHeight = partition.reduce((acc, node) => acc + this.getSubTreeHeight(node), totalGap);

        return totalNodesHeight;
    }
}
