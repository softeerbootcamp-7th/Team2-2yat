import { createContext, useContext, useRef } from "react";
import { useCallback, useSyncExternalStore } from "react";

import { NodeId } from "@/features/mindmap/types/mindmapType";
import NodeContainer from "@/features/mindmap/utils/nodeContainer";
import { EventBroker } from "@/utils/eventBroker";

const MindMapContext = createContext<{
    container: NodeContainer;
    broker: EventBroker<NodeId>;
} | null>(null);

export const MindMapProvider = ({ children }: { children: React.ReactNode }) => {
    const mindmapRef = useRef<{
        container: NodeContainer;
        broker: EventBroker<NodeId>;
    } | null>(null);

    if (!mindmapRef.current) {
        const broker = new EventBroker<NodeId>();

        mindmapRef.current = {
            container: new NodeContainer({
                broker,
                // 지금은 없으므로 ..
                quadTreeManager: {} as any,
            }),
            broker,
        };
    }

    return <MindMapContext.Provider value={mindmapRef.current}>{children}</MindMapContext.Provider>;
};

export const useMindmapContainer = () => {
    const context = useContext(MindMapContext);
    if (!context) throw new Error("Provider is missing!");
    return context;
};

export const useNode = (nodeId: NodeId) => {
    const { container, broker } = useMindmapContainer();

    // nodeId가 바뀔 떄만 호출해야해서 useCallback
    const subscribe = useCallback(
        // onStoreChange = 상태가 바뀌면 이걸 호출해라. 리렌더링은 내가 하겟다(key바꾸는 거랑 비슷한 매커니즘인듯)
        (onStoreChange: () => void) => {
            return broker.subscribe({ key: nodeId, callback: onStoreChange });
        },
        [container, nodeId],
    );

    const getSnapshot = useCallback(() => {
        return container.safeGetNode(nodeId);
    }, [container, nodeId]);

    const node = useSyncExternalStore(subscribe, getSnapshot);

    return node;
};
