import { NodeData, NodeElement, NodeId, NodeType } from "@/features/mindmap/types/mindmap_type";
import { EventBroker } from "@/utils/broker";
import generateId from "@/utils/generateId";

type QuadTreeManager = never;

const ROOT_NODE_PARENT_ID = "empty";
const ROOT_NODE_CONTENTS = "김현대의 마인드맵";

export default class NodeContainer {
    public nodeContainer: Map<NodeId, NodeElement>;
    private quadTreeManager: QuadTreeManager;
    private broker: EventBroker<NodeId>;

    constructor({
        quadTreeManager,
        broker,
        name = ROOT_NODE_CONTENTS,
    }: {
        quadTreeManager: QuadTreeManager;
        broker: EventBroker<NodeId>;
        name: string;
    }) {
        // initialization
        this.nodeContainer = new Map();
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
     * event broker의 publisher 호출. 원래 한 몸이었으나 성격이 달라 broker로 분리함.
     */
    private notify(nodeId: NodeId) {
        const node = this.nodeContainer.get(nodeId);
        if (node) {
            this.nodeContainer.set(nodeId, { ...node });
        }

        this.broker.publish(nodeId);
    }

    appendChild({ parentNodeId }: { parentNodeId: NodeId }) {
        try {
            const parentNode = this._getNode(parentNodeId);
            const newNode = this.generateNewNodeElement();

            if (parentNode.lastChildId) {
                // 자식 자연수
                const lastNode = this._getNode(parentNode.lastChildId);

                lastNode.nextId = newNode.id;
                newNode.prevId = lastNode.id;

                newNode.parentId = parentNode.id;
                parentNode.lastChildId = newNode.id;

                // this.notify(lastNode.id);
            } else {
                // 자식 0
                parentNode.firstChildId = newNode.id;
                parentNode.lastChildId = newNode.id;
                newNode.parentId = parentNode.id;
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

    appendTo({ baseNodeId, direction }: { baseNodeId: NodeId; direction: "prev" | "next" }) {
        try {
            const baseNode = this._getNode(baseNodeId);

            // Root 노드 옆에는 추가할 수 없음
            if (baseNode.parentId === ROOT_NODE_PARENT_ID) {
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

            this.notify(nextSibling.id);
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

            this.notify(prevSibling.id);
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

                this.notify(parentNode.id);
            }

            if (parentNode.lastChildId === node.id) {
                parentNode.lastChildId = node.prevId;

                this.notify(parentNode.id);
            }

            if (node.prevId) {
                const prevNode = this._getNode(node.prevId);
                prevNode.nextId = node.nextId;

                this.notify(prevNode.id);
            }

            if (node.nextId) {
                const nextNode = this._getNode(node.nextId);
                nextNode.prevId = node.prevId;

                this.notify(nextNode.id);
            }

            this.notify(nodeId);

            this._deleteTraverse({ nodeId });
        } catch (e) {
            if (e instanceof Error) {
                alert(e.message);
            } else {
                alert(String(e));
            }
        }
    }

    private _deleteTraverse({ nodeId }: { nodeId: NodeId }) {
        const node = this.getNodeFromContainer(nodeId);
        if (!node) {
            return;
        }

        let childId = node.firstChildId;

        while (childId) {
            const child = this.nodeContainer.get(childId);
            if (!child) break;

            const nextChildId = child.nextId;
            this._deleteTraverse({ nodeId: childId });
            childId = nextChildId;
        }

        this.notify(nodeId);
        this.deleteNodeFromContainer(nodeId);
    }

    private _getNode(nodeId: NodeId): NodeElement {
        const node = this.nodeContainer.get(nodeId);

        if (!node) {
            throw new Error(`일치하는 Node가 없습니다. (node_id: ${nodeId})`);
        }

        return node;
    }

    private detach({ node }: { node: NodeElement }) {
        if (node.type === "root") {
            throw new Error("루트 노드는 뗄 수 없습니다.");
        }

        const parentNode = this._getNode(node.parentId);

        // 1. 부모 포인터 갱신
        if (parentNode?.firstChildId === node.id) {
            parentNode.firstChildId = node.nextId;
        }
        if (parentNode?.lastChildId === node.id) {
            parentNode.lastChildId = node.prevId;
        }

        // 2. 형제 포인터 갱신
        if (node.prevId) {
            const prevNode = this._getNode(node.prevId);
            prevNode.nextId = node.nextId;
            this.notify(prevNode.id);
        }
        if (node.nextId) {
            const nextNode = this._getNode(node.nextId);
            nextNode.prevId = node.prevId;
            this.notify(nextNode.id);
        }

        // 3. 부모 알림
        this.notify(parentNode.id);

        // 4. [수정됨] 본인 데이터 처리를 먼저 다 끝내고 notify 해야 함
        node.prevId = null;
        node.nextId = null;
        node.parentId = "detached"; // 임시 상태

        // 5. [수정됨] 이제 notify (이 시점에 Map에 "detached" 상태인 복사본이 저장됨)
        this.notify(node.id);
    }
    moveTo({
        baseNodeId,
        movingNodeId,
        direction,
    }: {
        baseNodeId: NodeId;
        movingNodeId: NodeId;
        direction: "prev" | "next" | "child";
    }) {
        if (baseNodeId === movingNodeId) return;

        try {
            let baseNode = this._getNode(baseNodeId);
            // 여기서 movingNode를 가져오지만...
            let movingNode = this._getNode(movingNodeId);

            // ... (사이클 방지 로직 생략 - 기존 유지) ...
            const currentParentId: string | null = baseNode.parentId;
            if (direction === "child" && baseNodeId === movingNodeId) return;
            let checkNodeId = baseNode.id;
            if (direction !== "child") checkNodeId = baseNode.parentId!;

            let tempParent = this.safeGetNode(checkNodeId);
            while (tempParent) {
                if (tempParent.id === movingNodeId) throw new Error("자손 밑으로 이동 불가");
                if (tempParent.id === ROOT_NODE_PARENT_ID) break;
                tempParent = this.safeGetNode(tempParent.parentId);
            }

            // 1. Detach 실행
            // 내부에서 notify가 돌면서 Map의 movingNode가 새로운 객체로 교체됨
            this.detach({ node: movingNode });

            // 2. [🔥 핵심 수정] 참조 갱신 (Refresh Reference)
            // detach에 의해 Map 내부의 객체가 바뀌었으므로, movingNode 변수를 최신화해야 함
            // 이걸 안 하면 attach 함수들이 옛날 객체(movingNode)를 수정하고,
            // notify는 Map에 있는 새 객체를 복사해서 저장하느라 수정사항이 씹힘.
            baseNode = this._getNode(baseNodeId);
            movingNode = this._getNode(movingNodeId);

            // 3. 연결 실행 (이제 싱싱한 객체를 넘김)
            if (direction === "prev") {
                this.attachPrev({ baseNode, movingNode });
            } else if (direction === "next") {
                this.attachNext({ baseNode, movingNode });
            } else if (direction === "child") {
                this.attachChild({ parentNode: baseNode, movingNode });
            }
        } catch (e) {
            console.error(e);
            if (e instanceof Error) {
                alert(e.message);
            } else {
                alert(String(e));
            }
        }
    }

    // [New] 기존 노드를 parentNode의 맨 마지막 자식으로 붙임
    private attachChild({ parentNode, movingNode }: { parentNode: NodeElement; movingNode: NodeElement }) {
        movingNode.parentId = parentNode.id;

        if (parentNode.lastChildId) {
            // 이미 자식이 있다면 막내 뒤에 붙임
            const lastNode = this._getNode(parentNode.lastChildId);

            lastNode.nextId = movingNode.id;
            movingNode.prevId = lastNode.id;
            movingNode.nextId = null;

            parentNode.lastChildId = movingNode.id;

            this.notify(lastNode.id); // 이전 막내 알림
        } else {
            // 자식이 없다면 첫째이자 막내가 됨
            parentNode.firstChildId = movingNode.id;
            parentNode.lastChildId = movingNode.id;
            movingNode.prevId = null;
            movingNode.nextId = null;
        }

        // 여기서도 부모 알림은 마지막에 한 번!
        this.notify(parentNode.id);
        this.notify(movingNode.id);
    }

    getChildIds(nodeId: NodeId): NodeId[] {
        const node = this.safeGetNode(nodeId);
        if (!node) return [];

        const childIds: NodeId[] = [];
        let currentChildId = node.firstChildId;

        // Linked List를 순회하며 배열로 변환
        while (currentChildId) {
            childIds.push(currentChildId);

            const childNode = this.safeGetNode(currentChildId);
            // 방어 로직: 링크가 깨져서 무한루프 도는 것 방지
            if (!childNode) break;

            currentChildId = childNode.nextId;
        }

        return childIds;
    }

    safeGetNode(nodeId: NodeId) {
        if (!nodeId || nodeId === ROOT_NODE_PARENT_ID) return undefined;

        return this.nodeContainer.get(nodeId);
    }

    /**
     * movingNode를 baseNode의 '뒤(Next)'에 연결합니다.
     */

    /**
     * nodeId를 받아 내용을 업데이트합니다.
     */
    update({ nodeId, newNodeData }: { nodeId: NodeId; newNodeData: Partial<Omit<NodeElement, "id">> }) {
        // TODO: newNodeData의 형을 다르게 해야할 수 있습니다. 일단은 Element로 뚫었는데 Node만 뚫어도될지도. 아직은 구현체가 확실하지 않아서 모르겠음.
        try {
            const { id, ...rest } = this._getNode(nodeId);

            const newNodeElement: NodeElement = { ...rest, ...newNodeData, id };

            this.nodeContainer.set(id, newNodeElement);

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
        this.nodeContainer.set(node.id, node);
    }

    private deleteNodeFromContainer(nodeId: NodeId) {
        this.nodeContainer.delete(nodeId);
    }
}
