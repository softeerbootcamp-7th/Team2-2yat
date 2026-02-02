import React, { memo, useCallback, useEffect, useLayoutEffect, useMemo, useRef, useState } from "react";

import { MindMapProvider, useMindmapContainer, useNode } from "@/features/mindmap/providers/NodeContainerProvider";
import TreeLayoutManager from "@/features/mindmap/utils/treeLayoutManager";

const Edge = memo(({ fromId, toId }: { fromId: string; toId: string }) => {
    const fromNode = useNode(fromId);
    const toNode = useNode(toId);

    // 데이터가 불완전하면 그리지 않음
    if (!fromNode || !toNode || !fromNode.width || !toNode.width) return null;

    const startX = fromNode.x + fromNode.width;
    const startY = fromNode.y + fromNode.height / 2;
    const endX = toNode.x;
    const endY = toNode.y + toNode.height / 2;

    const controlPointX = startX + (endX - startX) / 2;
    const pathData = `M ${startX} ${startY} C ${controlPointX} ${startY}, ${controlPointX} ${endY}, ${endX} ${endY}`;

    return <path d={pathData} fill="none" stroke="#cbd5e1" strokeWidth="2" strokeLinecap="round" />;
});
Edge.displayName = "Edge";

const NodeLayer = memo(({ rootId, runLayout }: { rootId: string; runLayout: () => void }) => {
    return <NodeView nodeId={rootId} runLayout={runLayout} />;
});
NodeLayer.displayName = "NodeLayer";

const EdgeLayer = memo(({ version }: { version: number }) => {
    const { container } = useMindmapContainer();

    // version이 바뀌면 Edge 목록을 다시 계산
    const edges = useMemo(() => {
        // eslint-disable-next-line @typescript-eslint/no-unused-vars
        const _v = version; // 의존성 주입을 위해 사용
        return Array.from(container.nodeContainer.keys()).flatMap((parentId) => {
            const children = container.getChildIds(parentId);
            return children.map((childId) => ({
                id: `${parentId}-${childId}`,
                fromId: parentId,
                toId: childId,
            }));
        });
    }, [container, version]);

    return (
        <svg
            style={{
                position: "absolute",
                top: 0,
                left: 0,
                width: "100%",
                height: "100%",
                pointerEvents: "none",
                zIndex: 0,
            }}
        >
            {edges.map((edge) => (
                <Edge key={edge.id} fromId={edge.fromId} toId={edge.toId} />
            ))}
        </svg>
    );
});
EdgeLayer.displayName = "EdgeLayer";

const NodeView = React.memo(({ nodeId, runLayout }: { nodeId: string; runLayout: any }) => {
    const node = useNode(nodeId);
    const { container } = useMindmapContainer();

    const ref = useRef<HTMLDivElement>(null); // DOM 측정을 위한 ref
    const childIds = useMemo(() => {
        return container.getChildIds(nodeId);
    }, [node, container, nodeId]);

    if (!node) return null; // 삭제된 경우

    const isRoot = node.type === "root";

    const randomPos = useMemo(
        () => ({
            x: Math.floor(Math.random() * 600) + 50,
            y: Math.floor(Math.random() * 400) + 50,
        }),
        [],
    );

    useLayoutEffect(() => {
        if (ref.current && node) {
            const { offsetWidth, offsetHeight } = ref.current;
            const isSizeChanged = node.width !== offsetWidth || node.height !== offsetHeight;

            if (isSizeChanged) {
                // 1. 데이터 업데이트
                container.update({
                    nodeId,
                    newNodeData: { width: offsetWidth, height: offsetHeight },
                });
                // 2. [중요] 크기가 바뀌었으니 레이아웃을 다시 계산해라! 라고 알림
                runLayout();
            }
        }
    }, [container, node?.width, node?.height, nodeId, runLayout]);

    // --- 핸들러 ---

    const handleAddChild = () => {
        container.appendChild({ parentNodeId: nodeId });
        runLayout();
    };

    const handleDelete = () => {
        if (confirm("정말 삭제하시겠습니까?")) {
            container.delete({ nodeId });
        }
    };

    return (
        <>
            <div
                ref={ref}
                className="node-group" // CSS 타겟팅을 위한 클래스
                style={{
                    position: "absolute",
                    transform: `translate(${node.x}px, ${node.y}px)`,
                    padding: "8px 16px",
                    border: `2px solid ${node.type === "root" ? "#3b82f6" : "#cbd5e1"}`,
                    backgroundColor: node.type === "root" ? "#eff6ff" : "white",
                    borderRadius: "8px",
                    whiteSpace: "nowrap",
                    cursor: "pointer",
                    // transition: "transform 0.3s cubic-bezier(0.25, 0.8, 0.25, 1)",
                    boxShadow: "0 4px 6px -1px rgb(0 0 0 / 0.1)",
                }}
            >
                <div style={{ fontWeight: 600 }}>{node.id.slice(0, 4)}</div>

                {/* --- [Action Buttons] --- */}
                {/* 호버 시에만 노출 */}
                <div
                    className="action-buttons"
                    style={{
                        position: "absolute",
                        display: "flex",
                        top: 3,
                        gap: 4,
                        zIndex: 30,
                        overflow: "visible", // [추가] 버튼은 보이게
                    }}
                >
                    {/* 자식 추가 버튼 */}
                    <button onClick={handleAddChild} title="자식 추가">
                        +
                    </button>

                    {/* 삭제 버튼 (Root는 삭제 불가 처리) */}
                    {node.type !== "root" && (
                        <button onClick={handleDelete} title="노드 삭제">
                            ×
                        </button>
                    )}
                </div>
            </div>

            {childIds.length > 0 &&
                childIds.map((childId) => <NodeView key={childId} nodeId={childId} runLayout={runLayout} />)}
        </>
    );
});

NodeView.displayName = "NodeView";

const ModifiedRecursiveRenderer = React.memo(({ nodeId, runLayout }: any) => {
    const node = useNode(nodeId);

    if (!node) return null;

    return <NodeView nodeId={nodeId} runLayout={runLayout} />;
});

ModifiedRecursiveRenderer.displayName = "ModifiedRecursiveRenderer";

export default function MindMapShowcase() {
    return (
        <MindMapProvider>
            <Canvas />
        </MindMapProvider>
    );
}

const Canvas = () => {
    const { container } = useMindmapContainer();

    // 1. Edge 갱신용 버전 상태
    const [layoutVersion, setLayoutVersion] = useState(0);

    const layoutManager = useMemo(() => new TreeLayoutManager(container), [container]);

    const rootId = useMemo(() => {
        for (const [id, node] of container.nodeContainer.entries()) {
            if (node.type === "root") return id;
        }
        return null;
    }, [container]);

    // 2. [핵심] runLayout 함수 안정화 (useCallback)
    // rootId나 manager가 바뀌지 않는 한 이 함수의 '참조'는 변하지 않습니다.
    // 따라서 NodeLayer -> NodeView로 전달될 때 불필요한 리렌더링을 유발하지 않습니다.
    const handleLayout = useCallback(() => {
        if (!rootId) return;

        layoutManager.layout(rootId);
        // 레이아웃 계산 후 EdgeLayer만 다시 그리라고 신호
        setLayoutVersion((v) => v + 1);
    }, [layoutManager, rootId]);

    // 초기 로딩 시 레이아웃 실행
    useEffect(() => {
        if (rootId) {
            handleLayout();
        }
    }, [rootId, handleLayout, container.nodeContainer.size]);

    if (!rootId) return <div>Loading...</div>;

    return (
        <div style={{ position: "relative", width: "100%", height: "100vh", overflow: "hidden" }}>
            {/* EdgeLayer는 layoutVersion이 바뀔 때만 리렌더링 */}
            <EdgeLayer version={layoutVersion} />

            {/* NodeLayer는 rootId나 handleLayout 함수 자체가 바뀔 때만 리렌더링 */}
            {/* handleLayout은 useCallback으로 고정되어 있으므로, 
                setLayoutVersion으로 Canvas가 리렌더링 되어도 NodeLayer는 영향받지 않음 */}
            <NodeLayer rootId={rootId} runLayout={handleLayout} />
        </div>
    );
};
