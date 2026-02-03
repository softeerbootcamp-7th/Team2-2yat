import { NodeData, NodeElement, NodeId, NodeType } from "@/features/mindmap/types/mindmapType";
import { EventBroker } from "@/utils/eventBroker";
import generateId from "@/utils/generateId";

// TODO: quadtree 준비되면 의존성 주입
type QuadTreeManager = undefined;

const ROOT_NODE_PARENT_ID = "empty";
const ROOT_NODE_CONTENTS = "김현대의 마인드맵";

export default class MindmapContainer {
    public nodes: Map<NodeId, NodeElement>;
    private quadTreeManager: QuadTreeManager;
    private broker: EventBroker<NodeId>;

    constructor({
        quadTreeManager,
        broker,
        name = ROOT_NODE_CONTENTS,
    }: {
        quadTreeManager: QuadTreeManager;
        broker: EventBroker<NodeId>;
        name?: string;
    }) {
        // initialization
        this.nodes = new Map();
        const rootNodeElement = this.generateNewNodeElement({
            nodeData: {
                contents: name,
            },
            type: "root",
        });
        this.addNodeToContainer(rootNodeElement);

        // inject dependency
        this.quadTreeManager = quadTreeManager;
        this.broker = broker;
    }

    /**
     * 배치가 바뀌었을 때 rerendering trigger 하기 위해 사용한다.
     * 안쓰면 UI 업데이트 안될 것.
     */
    private notify(nodeId: NodeId) {
        const node = this.nodes.get(nodeId);
        if (node) {
            this.nodes.set(nodeId, { ...node });
        }

        this.broker.publish(nodeId);
    }

    appendChild({
        parentNodeId,
        childNode = this.generateNewNodeElement(),
    }: {
        parentNodeId: NodeId;
        childNode?: NodeElement;
    }) {
        try {
            const parentNode = this._getNode(parentNodeId);
            childNode.parentId = parentNodeId;

            if (parentNode.lastChildId) {
                // 자식 자연수
                const lastNode = this._getNode(parentNode.lastChildId);

                lastNode.nextId = childNode.id;
                childNode.prevId = lastNode.id;
                childNode.nextId = null; // 필요없긴함

                parentNode.lastChildId = childNode.id;

                // this.notify(lastNode.id);
            } else {
                // 자식 0
                parentNode.firstChildId = childNode.id;
                parentNode.lastChildId = childNode.id;
            }

            // this.notify(newNode.id);

            this.notify(parentNode.id);
        } catch (e) {
            if (e instanceof Error) {
                alert(e.message);
            } else {
                alert(String(e));
            }
        }
    }

    attachTo({ baseNodeId, direction }: { baseNodeId: NodeId; direction: "prev" | "next" }) {
        try {
            const baseNode = this._getNode(baseNodeId);

            // Root 노드 옆에는 추가할 수 없음
            if (baseNode.type === "root") {
                throw new Error("루트 노드의 형제로는 노드를 추가할 수 없습니다.");
            }

            const newNode = this.generateNewNodeElement();

            if (direction === "next") {
                this.attachNext({ baseNode, movingNode: newNode });
            } else {
                this.attachPrev({ baseNode, movingNode: newNode });
            }
        } catch (e) {
            if (e instanceof Error) {
                alert(e.message);
            } else {
                alert(String(e));
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

            // this.notify(nextSibling.id);
        }

        baseNode.nextId = movingNode.id;

        const parentNode = this._getNode(baseNode.parentId);
        if (parentNode.lastChildId === baseNode.id) {
            parentNode.lastChildId = movingNode.id;

            // this.notify(parent.id);
        }
        this.notify(parentNode.id);

        // this.notify(movingNode.id);
        // this.notify(baseNode.id);
    }

    private attachPrev({ baseNode, movingNode }: { baseNode: NodeElement; movingNode: NodeElement }) {
        movingNode.parentId = baseNode.parentId;

        movingNode.nextId = baseNode.id;
        movingNode.prevId = baseNode.prevId;

        if (baseNode.prevId) {
            const prevSibling = this._getNode(baseNode.prevId);
            prevSibling.nextId = movingNode.id;

            // this.notify(prevSibling.id);
        }

        baseNode.prevId = movingNode.id;

        const parentNode = this._getNode(baseNode.parentId);

        if (parentNode.firstChildId === baseNode.id) {
            parentNode.firstChildId = movingNode.id;
        }

        // this.notify(parent.id);
        this.notify(parentNode.id);

        // this.notify(movingNode.id); // 부모, prev, next 다 바뀜
        // this.notify(baseNode.id); // prev 바뀜
    }

    delete({ nodeId }: { nodeId: NodeId }) {
        try {
            const node = this._getNode(nodeId);
            if (node.type === "root") {
                throw new Error("루트 노드는 삭제할 수 없습니다.");
            }

            const parentNode = this._getNode(node.parentId!);

            if (parentNode.firstChildId === node.id) {
                parentNode.firstChildId = node.nextId;
                // this.notify(parentNode.id);
            }

            if (parentNode.lastChildId === node.id) {
                parentNode.lastChildId = node.prevId;
                // this.notify(parentNode.id);
            }

            if (node.prevId) {
                const prevNode = this._getNode(node.prevId);
                prevNode.nextId = node.nextId;
                // this.notify(prevNode.id);
            }

            if (node.nextId) {
                const nextNode = this._getNode(node.nextId);
                nextNode.prevId = node.prevId;
                // this.notify(nextNode.id);
            }

            this._deleteTraverse({ nodeId });

            this.notify(parentNode.id);

            // this.notify(nodeId);
        } catch (e) {
            if (e instanceof Error) {
                alert(e.message);
            } else {
                alert(String(e));
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

            // baseNode = this._getNode(baseNodeId);
            // movingNode = this._getNode(movingNodeId);

            if (direction === "prev") {
                this.attachPrev({ baseNode, movingNode });
            } else if (direction === "next") {
                this.attachNext({ baseNode, movingNode });
            } else if (direction === "child") {
                this.appendChild({ parentNodeId: baseNode.id, childNode: movingNode });
            }
        } catch (e) {
            if (e instanceof Error) {
                alert(e.message);
            } else {
                alert(String(e));
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
            // this.notify(prevNode.id);
        }

        if (node.nextId) {
            const nextNode = this._getNode(node.nextId);
            nextNode.prevId = node.prevId;
            // this.notify(nextNode.id);
        }

        this.notify(parentNode.id);

        node.prevId = null;
        node.nextId = null;
        node.parentId = "detached"; // 임시 상태

        // this.notify(node.id);
    }

    getChildIds(nodeId: NodeId): NodeId[] {
        const node = this.safeGetNode(nodeId);
        if (!node) return [];

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

    update({ nodeId, newNodeData }: { nodeId: NodeId; newNodeData: Partial<Omit<NodeElement, "id">> }) {
        // TODO: newNodeData의 형을 다르게 해야할 수 있습니다. 일단은 Element로 뚫었는데 Node만 뚫어도될지도. 아직은 구현체가 확실하지 않아서 모르겠음.
        try {
            const { id, ...rest } = this._getNode(nodeId);

            const newNodeElement: NodeElement = { ...rest, ...newNodeData, id };

            this.addNodeToContainer(newNodeElement);

            this.notify(id);
        } catch (e) {
            if (e instanceof Error) {
                alert(e.message);
            } else {
                alert(String(e));
            }
        }
    }

    /**
     * view 단에서 errorBoundary를 바로 보여주는게 위험할 수 있음. 왜냐면 프론트엔드의 실수가 있을 수 있는데 바로 사용 못하게 EB띄우는 것보다 toast로만 띄워줘도 좋을 것 같음. 그래서 try catch사용함.
     */
    getNodeFromContainer(nodeId: NodeId) {
        try {
            const node = this._getNode(nodeId);

            return node;
        } catch (e) {
            // TODO: toast UI로 대체
            if (e instanceof Error) {
                alert(e.message);
            } else {
                alert(String(e));
            }
        }
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
}
