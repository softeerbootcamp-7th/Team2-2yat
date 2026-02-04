import { createContext, useCallback, useContext, useRef, useSyncExternalStore } from "react";

import { NodeId } from "@/features/mindmap/types/mindmapType";
import MindmapContainer from "@/features/mindmap/utils/MindmapContainer";
import { EventBroker } from "@/utils/eventBroker";

const MindMapContext = createContext<{
    container: MindmapContainer;
    broker: EventBroker<NodeId>;
} | null>(null);

export const MindMapProvider = ({ children }: { children: React.ReactNode }) => {
    const mindmapRef = useRef<{
        container: MindmapContainer;
        broker: EventBroker<NodeId>;
    } | null>(null);

    if (!mindmapRef.current) {
        const broker = new EventBroker<NodeId>();

        mindmapRef.current = {
            container: new MindmapContainer({
                broker,
                // TODO: 지금은 없으므로 ..
                quadTreeManager: undefined,
            }),
            broker,
        };
    }

    return <MindMapContext.Provider value={mindmapRef.current}>{children}</MindMapContext.Provider>;
};

export const useMindmapContext = () => {
    const context = useContext(MindMapContext);

    if (!context) throw new Error("Provider is missing!");

    return context;
};

export const useNode = (nodeId: NodeId) => {
    const { container, broker } = useMindmapContext();

    const subscribe = useCallback(
        (onStoreChange: () => void) => {
            return broker.subscribe({
                key: nodeId,
                callback: onStoreChange,
            });
        },
        [broker, nodeId],
    );

    const getSnapshot = useCallback(() => {
        const snapshot = container.safeGetNode(nodeId);

        return snapshot;
    }, [container, nodeId]);

    return useSyncExternalStore(subscribe, getSnapshot);
};
