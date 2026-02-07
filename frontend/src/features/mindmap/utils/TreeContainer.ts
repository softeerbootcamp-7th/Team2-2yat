import { NodeData, NodeElement, NodeId, NodeType } from "@/features/mindmap/types/mindmapType";
import { EventBroker } from "@/utils/EventBroker";
import { exhaustiveCheck } from "@/utils/exhaustive_check";
import generateId from "@/utils/generate_id";

// TODO: quadtree 준비되면 의존성 주입
type QuadTreeManager = undefined;

const ROOT_NODE_PARENT_ID = "empty";
const ROOT_NODE_CONTENTS = "김현대의 마인드맵";
const DETACHED_NODE_PARENT_ID = "detached";

export default class TreeContainer {
    public nodes: Map<NodeId, NodeElement>;
    private quadTreeManager: QuadTreeManager;
    private broker: EventBroker<NodeId>;
    private isThrowError: boolean;
    private rootNodeId: NodeId;

    constructor({
        quadTreeManager,
        broker,
        name = ROOT_NODE_CONTENTS,

        // TODO: 개발 단계에서는 error boundary로 대체되면 디버깅이 어려우므로 해당 옵션을 제공.
        isThrowError = true,
    }: {
        quadTreeManager: QuadTreeManager;
        broker: EventBroker<NodeId>;
        name?: string;
        isThrowError?: boolean;
    }) {
        // initialization
        this.nodes = new Map();
        const rootNodeElement = this.generateNewNodeElement({
            nodeData: {
                contents: name,
            },
            type: "root",
        });
        this.rootNodeId = rootNodeElement.id;
        this.addNodeToContainer(rootNodeElement);

        // inject dependency
        this.quadTreeManager = quadTreeManager;
        this.broker = broker;
        this.isThrowError = isThrowError;
    }

    private notify(nodeId: NodeId) {
        const node = this.nodes.get(nodeId);
        if (node) {
            this.nodes.set(nodeId, { ...node });
        }

        this.broker.publish(nodeId);
    }

    appendChild({ parentNodeId, childNodeId: cId }: { parentNodeId: NodeId; childNodeId?: NodeId }) {
        try {
            const childNode = cId ? this._getNode(cId) : this.generateNewNodeElement();

            const parentNode = this._getNode(parentNodeId);
            childNode.parentId = parentNodeId;

            if (parentNode.lastChildId) {
                // 자식 자연수
                const lastNode = this._getNode(parentNode.lastChildId);

                lastNode.nextId = childNode.id;
                childNode.prevId = lastNode.id;
                childNode.nextId = null; // 필요없긴함

                parentNode.lastChildId = childNode.id;
            } else {
                // 자식 0
                parentNode.firstChildId = childNode.id;
                parentNode.lastChildId = childNode.id;
            }

            this.notify(parentNode.id);
        } catch (e) {
            if (e instanceof Error) {
                console.error(e.message);
            } else {
                console.error(String(e));
            }

            if (this.isThrowError) {
                throw e;
            }
        }
    }

    attachTo({ baseNodeId, direction }: { baseNodeId: NodeId; direction: "prev" | "next" | "child" }) {
        try {
            const baseNode = this._getNode(baseNodeId);

            // Root 노드 옆에는 추가할 수 없음
            if (baseNode.type === "root") {
                throw new Error("루트 노드의 형제로는 노드를 추가할 수 없습니다.");
            }

            const newNode = this.generateNewNodeElement();

            switch (direction) {
                case "next":
                    this.attachNext({ baseNode, movingNode: newNode });
                    break;
                case "prev":
                    this.attachPrev({ baseNode, movingNode: newNode });
                    break;
                case "child":
                    this.appendChild({ parentNodeId: baseNode.id, childNodeId: newNode.id });
                    break;
                default:
                    exhaustiveCheck(`${direction} 방향은 불가능합니다.`);
            }

            this.notify(baseNode.id);
        } catch (e) {
            if (e instanceof Error) {
                console.error(e.message);
            } else {
                console.error(String(e));
            }

            if (this.isThrowError) {
                throw e;
            }
        }
    }

    private attachNext({ baseNode, movingNode }: { baseNode: NodeElement; movingNode: NodeElement }) {
        movingNode.parentId = baseNode.parentId;

        movingNode.prevId = baseNode.id;
        movingNode.nextId = baseNode.nextId;

        if (baseNode.nextId) {
            const nextSibling = this._getNode(baseNode.nextId);

            nextSibling.prevId = movingNode.id;
        }

        baseNode.nextId = movingNode.id;

        const parentNode = this._getNode(baseNode.parentId);
        if (parentNode.lastChildId === baseNode.id) {
            parentNode.lastChildId = movingNode.id;
        }
        this.notify(parentNode.id);
    }

    private attachPrev({ baseNode, movingNode }: { baseNode: NodeElement; movingNode: NodeElement }) {
        movingNode.parentId = baseNode.parentId;

        movingNode.nextId = baseNode.id;
        movingNode.prevId = baseNode.prevId;

        if (baseNode.prevId) {
            const prevSibling = this._getNode(baseNode.prevId);

            prevSibling.nextId = movingNode.id;
        }

        baseNode.prevId = movingNode.id;

        const parentNode = this._getNode(baseNode.parentId);

        if (parentNode.firstChildId === baseNode.id) {
            parentNode.firstChildId = movingNode.id;
        }

        this.notify(parentNode.id);
    }

    delete({ nodeId }: { nodeId: NodeId }) {
        try {
            const node = this._getNode(nodeId);
            if (node.type === "root") {
                throw new Error("루트 노드는 삭제할 수 없습니다.");
            }

            const parentNode = this._getNode(node.parentId);

            if (parentNode.firstChildId === node.id) {
                parentNode.firstChildId = node.nextId;
            }

            if (parentNode.lastChildId === node.id) {
                parentNode.lastChildId = node.prevId;
            }

            if (node.prevId) {
                const prevNode = this._getNode(node.prevId);
                prevNode.nextId = node.nextId;
            }

            if (node.nextId) {
                const nextNode = this._getNode(node.nextId);
                nextNode.prevId = node.prevId;
            }

            this._deleteTraverse({ nodeId });

            this.notify(parentNode.id);
        } catch (e) {
            if (e instanceof Error) {
                console.error(e.message);
            } else {
                console.error(String(e));
            }

            if (this.isThrowError) {
                throw e;
            }
        }
    }

    private _deleteTraverse({ nodeId }: { nodeId: NodeId }) {
        const node = this._getNode(nodeId);

        let childId = node.firstChildId;

        while (childId) {
            const child = this.safeGetNode(childId);
            if (!child) break;

            this._deleteTraverse({ nodeId: childId });

            childId = child.nextId;
        }

        this.deleteNodeFromContainer(nodeId);
    }

    private _getNode(nodeId: NodeId): NodeElement {
        const node = this.nodes.get(nodeId);

        if (!node) {
            throw new Error(`일치하는 Node가 없습니다. (node_id: ${nodeId})`);
        }

        return node;
    }

    /**
     * 아직 인자를 어떻게 받아야 좋을 지 확신 못함.
     */
    moveTo({
        baseNodeId,
        movingNodeId,
        direction,
    }: {
        baseNodeId: NodeId;
        movingNodeId: NodeId;
        direction: "prev" | "next" | "child";
    }) {
        // 제자리
        if (direction === "child" && baseNodeId === movingNodeId) {
            return;
        }

        if (baseNodeId === movingNodeId) {
            return;
        }

        try {
            const baseNode = this._getNode(baseNodeId);
            const movingNode = this._getNode(movingNodeId);

            let checkNodeId = baseNode.id;
            if (direction !== "child") {
                checkNodeId = baseNode.parentId;
            }

            // drop한 곳에서 위로 가면서 movingNode가 있는지 확인
            let tempParent = this.safeGetNode(checkNodeId);
            while (tempParent) {
                if (tempParent.id === movingNodeId) {
                    throw new Error("자손 밑으로 이동 불가");
                }

                if (tempParent.type === "root") {
                    break;
                }

                tempParent = this.safeGetNode(tempParent.parentId);
            }

            this.detach({ node: movingNode });

            switch (direction) {
                case "next":
                    this.attachNext({ baseNode, movingNode });
                    break;
                case "prev":
                    this.attachPrev({ baseNode, movingNode });
                    break;
                case "child":
                    this.appendChild({ parentNodeId: baseNode.id, childNodeId: movingNode.id });
                    break;
                default:
                    exhaustiveCheck(`${direction} 방향은 불가능합니다.`);
            }

            this.notify(baseNode.id);
        } catch (e) {
            if (e instanceof Error) {
                console.error(e.message);
            } else {
                console.error(String(e));
            }

            if (this.isThrowError) {
                throw e;
            }
        }
    }

    private detach({ node }: { node: NodeElement }) {
        if (node.type === "root") {
            throw new Error("루트 노드는 뗄 수 없습니다.");
        }

        const parentNode = this._getNode(node.parentId);

        // 1. 부모 포인터 갱신
        if (parentNode.firstChildId === node.id) {
            parentNode.firstChildId = node.nextId;
        }

        if (parentNode.lastChildId === node.id) {
            parentNode.lastChildId = node.prevId;
        }

        if (node.prevId) {
            const prevNode = this._getNode(node.prevId);
            prevNode.nextId = node.nextId;
        }

        if (node.nextId) {
            const nextNode = this._getNode(node.nextId);
            nextNode.prevId = node.prevId;
        }

        this.notify(parentNode.id);

        node.prevId = null;
        node.nextId = null;
        node.parentId = DETACHED_NODE_PARENT_ID; // 임시 상태.
    }

    getChildIds(nodeId: NodeId): NodeId[] {
        const node = this.safeGetNode(nodeId);
        if (!node) {
            return [];
        }

        const childIds: NodeId[] = [];
        let currentChildId = node.firstChildId;

        while (currentChildId) {
            childIds.push(currentChildId);

            const childNode = this.safeGetNode(currentChildId);
            if (!childNode) {
                break;
            }

            currentChildId = childNode.nextId;
        }

        return childIds;
    }

    safeGetParentNode(nodeId: NodeId) {
        const node = this.safeGetNode(nodeId);

        if (!node) {
            return undefined;
        }

        const parentNode = this.safeGetNode(node.parentId);

        if (!parentNode) {
            return undefined;
        }

        return parentNode;
    }

    update({ nodeId, newNodeData }: { nodeId: NodeId; newNodeData: Partial<Omit<NodeElement, "id">> }) {
        // TODO: newNodeData의 형을 다르게 해야할 수 있습니다. 일단은 Element로 뚫었는데 Node만 뚫어도될지도. 아직은 구현체가 확실하지 않아서 모르겠음.
        try {
            const { id, ...rest } = this._getNode(nodeId);

            const newNodeElement: NodeElement = { ...rest, ...newNodeData, id };

            this.addNodeToContainer(newNodeElement);

            this.notify(id);
        } catch (e) {
            if (e instanceof Error) {
                console.error(e.message);
            } else {
                console.error(String(e));
            }

            if (this.isThrowError) {
                throw e;
            }
        }
    }

    getAllDescendantIds(nodeId: NodeId): Set<NodeId> {
        const descendants = new Set<NodeId>();
        descendants.add(nodeId); // 자기 자신 포함

        const traverse = (currentId: NodeId) => {
            const children = this.getChildIds(currentId);
            children.forEach((childId) => {
                descendants.add(childId);
                traverse(childId); // 재귀 호출
            });
        };

        traverse(nodeId);
        return descendants;
    }

    getChildNodes(parentNodeId: NodeId): NodeElement[] {
        const node = this.safeGetNode(parentNodeId);
        if (!node) {
            return [];
        }

        const childNodes: NodeElement[] = [];
        let currentChildId = node.firstChildId;

        while (currentChildId) {
            const childNode = this.safeGetNode(currentChildId);

            if (!childNode) {
                console.error("유효하지 않은 childNode가 존재하므로 빈 배열을 반환합니다.");
                return [];
            }

            childNodes.push(childNode);

            currentChildId = childNode.nextId;
        }

        return childNodes;
    }

    private generateNewNodeElement({
        nodeData = { contents: "" },
        type = "normal",
    }: { nodeData?: NodeData; type?: NodeType } = {}) {
        const node: NodeElement = {
            id: generateId(),

            x: 0,
            y: 0,

            width: 0,
            height: 0,

            parentId: ROOT_NODE_PARENT_ID,

            firstChildId: null,
            lastChildId: null,

            nextId: null,
            prevId: null,

            data: nodeData,
            type,
        };

        this.addNodeToContainer(node);

        return node;
    }

    private addNodeToContainer(node: NodeElement) {
        this.nodes.set(node.id, node);
    }

    private deleteNodeFromContainer(nodeId: NodeId) {
        this.nodes.delete(nodeId);
    }

    safeGetNode(nodeId: NodeId) {
        const node = this.nodes.get(nodeId);

        if (!node) {
            return undefined;
        }

        return node;
    }

    getRootNode() {
        return this._getNode(this.rootNodeId);
    }
}
