/**
 * 해당 파일에 여러 훅, 로직이 함께 있습니다.
 * 하나가 수정되면 보통 다 수정되므로 파일 왔다갔다 없이 빠르게 수정할 수 있도록 함께 두었습니다.
 * 이후에 마인드맵 로직이 어느정도 굳어졌다 싶으면 분리할 예정입니다.
 */
import { createContext, useCallback, useContext, useMemo, useRef, useState, useSyncExternalStore } from "react";

import { NodeId } from "@/features/mindmap/types/mindmapType";
import MindmapLayoutManager from "@/features/mindmap/utils/MindmapLayoutManager";
import TreeContainer from "@/features/mindmap/utils/TreeContainer";
import { EventBroker } from "@/utils/EventBroker";

type MindMapRefContextType = {
    container: TreeContainer;
    broker: EventBroker<NodeId>;
    actions: {
        addNode: (parentId: NodeId) => void;
        deleteNode: (nodeId: NodeId) => void;
        moveNode: (targetId: NodeId, movingId: NodeId) => void;
        updateNodeSize: (nodeId: NodeId, width: number, height: number) => void;
        forceLayout: () => void;
    };
};

type MindMapStateContextType = {
    version: number;
};

const MindMapRefContext = createContext<MindMapRefContextType | null>(null);
const MindMapStateContext = createContext<MindMapStateContextType | null>(null);

// controller
export const MindMapProvider = ({ children }: { children: React.ReactNode }) => {
    const storeRef = useRef<{
        container: TreeContainer;
        broker: EventBroker<NodeId>;
        layoutManager: MindmapLayoutManager;
    } | null>(null);

    const [version, setVersion] = useState(0);

    if (!storeRef.current) {
        const broker = new EventBroker<NodeId>();
        const container = new TreeContainer({ broker, quadTreeManager: undefined });
        const layoutManager = new MindmapLayoutManager({ treeContainer: container });
        storeRef.current = { container, broker, layoutManager };
    }

    const { container, broker, layoutManager } = storeRef.current;

    // 지금은 필요한 메서드를 모두 호출하고 있음. 이는 유지보수를 매우매우 어렵게 함.
    // 그래서 이후 디펜던시 관계를 다시 정립해야할거임.
    const actions = useMemo(
        () => ({
            addNode: (parentId: NodeId) => {
                container.appendChild({ parentNodeId: parentId });
                layoutManager.invalidate(parentId);
                const rootId = container.getRootId();
                if (rootId) layoutManager.updateLayout({ rootId });
                setVersion((v) => v + 1);
            },
            deleteNode: (nodeId: NodeId) => {
                const parentId = container.getParentId(nodeId);
                container.delete({ nodeId });
                if (parentId) {
                    layoutManager.invalidate(parentId);
                    const rootId = container.getRootId();
                    if (rootId) layoutManager.updateLayout({ rootId });
                }
                setVersion((v) => v + 1);
            },
            updateNodeSize: (nodeId: NodeId, width: number, height: number) => {
                const node = container.safeGetNode(nodeId);
                if (node && (node.width !== width || node.height !== height)) {
                    container.update({ nodeId, newNodeData: { width, height } });
                    layoutManager.invalidate(nodeId);
                    const rootId = container.getRootId();
                    if (rootId) layoutManager.updateLayout({ rootId });
                    setVersion((v) => v + 1);
                }
            },
            moveNode: (targetId: NodeId, movingId: NodeId) => {
                const oldParentId = container.getParentId(movingId);
                container.moveTo({ baseNodeId: targetId, movingNodeId: movingId, direction: "child" });
                layoutManager.invalidate(targetId);
                if (oldParentId) layoutManager.invalidate(oldParentId);
                const rootId = container.getRootId();
                if (rootId) layoutManager.updateLayout({ rootId });
                setVersion((v) => v + 1);
            },
            forceLayout: () => {
                const rootId = container.getRootId();
                if (rootId) layoutManager.updateLayout({ rootId });
                setVersion((v) => v + 1);
            },
        }),
        [container, broker, layoutManager],
    );

    const refValue = useMemo(() => ({ container, broker, actions }), [container, broker, actions]);
    const stateValue = useMemo(() => ({ version }), [version]);

    return (
        <MindMapRefContext.Provider value={refValue}>
            <MindMapStateContext.Provider value={stateValue}>{children}</MindMapStateContext.Provider>
        </MindMapRefContext.Provider>
    );
};

export const useNode = (nodeId: NodeId) => {
    const context = useContext(MindMapRefContext);
    if (!context) throw new Error("Provider missing!");
    const { container, broker } = context;

    const subscribe = useCallback(
        (onStoreChange: () => void) => broker.subscribe({ key: nodeId, callback: onStoreChange }),
        [broker, nodeId],
    );

    const getSnapshot = useCallback(() => container.safeGetNode(nodeId), [container, nodeId]);

    return useSyncExternalStore(subscribe, getSnapshot);
};

export const useMindmapActions = () => {
    const context = useContext(MindMapRefContext);

    if (!context) throw new Error("Provider missing!");

    return context.actions;
};

export const useMindmapContainer = () => {
    const context = useContext(MindMapRefContext);
    if (!context) throw new Error("Provider missing!");
    return context.container;
};

// version만
// 해당 훅은 리렌더링 강제 트리거를 위한 값인 version을 사용하기 위한것인데.. 이후에 성능을 위해서는 해당 값을 제거해야할 필요가 있을것. 일단은 임시로 넣어두었습니다.
export const useMindmapVersion = () => {
    const context = useContext(MindMapStateContext);
    if (!context) throw new Error("Provider missing!");
    return context.version;
};
