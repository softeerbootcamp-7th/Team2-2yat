export type NodeId = string;

export type Node = {
    id: NodeId;

    x: number;
    y: number;

    width: number;
    height: number;

    data: NodeData;
};

export type NodeType = "root" | "normal";

export type NodeElement = Node & {
    parentId: NodeId;

    // double linked list
    nextId: NodeId | null;
    prevId: NodeId | null;

    firstChildId: NodeId | null;
    lastChildId: NodeId | null;

    type: NodeType;
};

export type NodeData = {
    contents: string;
    pakxepakxe?: "뭔 타입이 올지 모르겠으니..";
};
