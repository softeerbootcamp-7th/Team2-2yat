export type NodeId = string;

export type Node = {
    id: NodeId;

    x: number;
    y: number;

    width: number;
    height: number;

    data: NodeData;
};

export type NodeElement = Node & {
    parentNodeId: NodeId | null;

    // double linked list
    nextSibling: NodeElement | null;
    prevSibling: NodeElement | null;

    children: NodeElement | null;

    type: "root" | "normal";
};

export type NodeData = {
    contents: string;
    pakxepakxe?: "뭔 타입이 올지 모르겠으니..";
};
