import { memo, useMemo } from "react";

import { useMindmapContainer, useNode } from "@/features/mindmap/providers/NodeContainerProvider";

export const NodeItem = memo(({ nodeId }: { nodeId: string }) => {
    // 1. 내 데이터 구독 (데이터 바뀌면 나만 리렌더링)
    const node = useNode(nodeId);
    const { container } = useMindmapContainer();

    // 2. 자식 ID 목록 계산
    // node가 리렌더링될 때(즉, node 객체가 새로 바뀌었을 때)만 다시 계산
    const childIds = useMemo(() => {
        return container.getChildIds(nodeId);
    }, [node, container, nodeId]);
    // 주의: appendChild시 부모인 내 node.lastChildId가 바뀌면서 notify가 오고 -> 리렌더링 -> 여기서 childIds 갱신됨

    if (!node) return null;

    const handleAddChild = () => {
        container.appendChild({ parentNodeId: nodeId });
    };

    return (
        <div style={{ paddingLeft: 20, borderLeft: "1px solid #ccc" }}>
            <div>
                {/* 내용 출력 */}
                <b>{node.data.contents}</b>

                <button onClick={handleAddChild}>+</button>
                <button onClick={() => container.delete({ nodeId })}>-</button>
            </div>

            {/* 자식 렌더링 */}
            <div>
                {childIds.map((childId) => (
                    <NodeItem key={childId} nodeId={childId} />
                ))}
            </div>
        </div>
    );
});

NodeItem.displayName = "NodeItem";
