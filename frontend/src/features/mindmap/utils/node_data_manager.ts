import { nanoid } from "nanoid";

import { NodeData, NodeElement, NodeId } from "@/features/mindmap/types/mindmap_type";
import generateId from "@/utils/generateId";

type QuadTreeManager = never;

const ROOT_NODE_ID = "root";

export default class NodeContainer {
    private nodeContainer: Map<NodeId, NodeElement>;
    private quadTreeManager: QuadTreeManager;

    constructor({ quadTreeManager }: { quadTreeManager: QuadTreeManager }) {
        // initialization
        this.nodeContainer = new Map();
        this.nodeContainer.set(ROOT_NODE_ID, this.generateInitialNodeElement());

        // inject dependency
        this.quadTreeManager = quadTreeManager;
    }

    private generateInitialNodeElement() {
        const rootNodeElement: NodeElement = {
            id: ROOT_NODE_ID,

            x: 0,
            y: 0,

            width: 0,
            height: 0,

            type: "root",
            parentNodeId: null,
            children: null,
            nextSibling: null,
            prevSibling: null,

            data: {
                contents: "김현대의 마인드맵",
            },
        };

        return rootNodeElement;
    }

    appendChildNode({ parentNodeId }: { parentNodeId: NodeId }) {
        try {
            const parentNode = this._getNode(parentNodeId);
            const newNode = this.createNode();
        } catch (e) {}
    }

    // createNode(nodeData: NodeData) {
    //     const nodeId = generateId();

    //     if (this._getNode(nodeId)) {
    //         throw new Error("동일한 id를 가진 Node가 이미 존재합니다.");
    //     }

    //     // this.nodeContainer.set(nodeId,)
    // }

    // deleteNode(nodeId: NodeId) {
    //     if ()

    // }

    private _getNode(nodeId: NodeId): NodeElement {
        const node = this.nodeContainer.get(nodeId);

        if (!node) {
            throw new Error(`일치하는 Node가 없습니다. (node_id: ${nodeId})`);
        }

        return node;
    }

    /**
     * nodeId를 받아 내용을 업데이트합니다.
     */
    updateNode({ nodeId, newNodeData }: { nodeId: NodeId; newNodeData: Partial<Omit<NodeElement, "id">> }) {
        // TODO: newNodeData의 형을 다르게 해야할 수 있습니다. 일단은 Element로 뚫었는데 Node만 뚫어도될지도. 아직은 구현체가 확실하지 않아서 모르겠음.
        try {
            const { id, ...rest } = this._getNode(nodeId);

            const newNodeElement: NodeElement = { ...rest, ...newNodeData, id };

            this.nodeContainer.set(id, newNodeElement);
        } catch (e) {
            if (e instanceof Error) {
                alert(e.message);
            } else {
                alert(String(e));
            }
        }
    }

    // moveToParentNode({
    //     parentNodeId,
    //     movingNodeId,
    //     childIndex,
    // }: {
    //     parentNodeId: NodeId;
    //     movingNodeId: NodeId;
    //     childIndex: number;
    // }) {
    //     try {
    //         const parentNode = this._getNode(parentNodeId);
    //         const movingNode = this._getNode(movingNodeId);
    //     } catch (e) {
    //         // TODO: toast UI로 대체
    //         if (e instanceof Error) {
    //             alert(e.message);
    //         } else {
    //             alert(String(e));
    //         }
    //     }
    // }

    /**
     * 노드를 끼워넣습니다. O(1)
     */
    insertNode({ targetNodeId, movingNodeId }: { targetNodeId: NodeId; movingNodeId: NodeId }) {
        try {
            const targetNode = this._getNode(targetNodeId);
            const movingNode = this._getNode(movingNodeId);

            const nextNode = targetNode.nextSibling;
            if (nextNode) {
                movingNode.nextSibling = nextNode;
                nextNode.prevSibling = movingNode;
            }

            targetNode.nextSibling = movingNode;
            movingNode.prevSibling = targetNode;
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
    getNode(nodeId: NodeId) {
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

    private createNode() {
        const nodeId: NodeId = nanoid();
        const node: NodeElement = this.generateInitialNodeElement();

        this.nodeContainer.set(nodeId, node);

        return node;
    }
}
