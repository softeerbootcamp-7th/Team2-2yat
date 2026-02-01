import React, { memo, useCallback, useEffect, useLayoutEffect, useMemo, useRef, useState } from "react";

import { useNodeSelector } from "@/features/mindmap/providers/h";
import { MindMapProvider, useMindmapContainer, useNode } from "@/features/mindmap/providers/NodeContainerProvider";
import { NodeId } from "@/features/mindmap/types/mindmapType";
import TreeLayoutManager from "@/features/mindmap/utils/treeLayoutManager";

// --- [Components] ---

// MindMapShowcase.tsx 내부

const MindMapNode = React.memo(({ nodeId, onRequestLayout }: { nodeId: NodeId; onRequestLayout: () => void }) => {
    const node = useNodeSelector(nodeId, (n) => ({
        x: n.x,
        y: n.y,
        width: n.width,
        height: n.height,
        contents: n.data.contents,
        type: n.type,
        id: n.id,
    }));

    const { container } = useMindmapContainer();
    const ref = useRef<HTMLDivElement>(null);

    // Hover 상태 관리를 위한 state (CSS :hover로 대체 가능하지만 로직 분리를 위해 state 사용)
    useLayoutEffect(() => {
        if (ref.current && node) {
            const { offsetWidth, offsetHeight } = ref.current;

            // [핵심] 아주 미세한 차이거나, 단순 리렌더링인 경우 무시 (1px 오차 허용)
            const isWidthChanged = Math.abs(node.width - offsetWidth) > 1;
            const isHeightChanged = Math.abs(node.height - offsetHeight) > 1;

            if (isWidthChanged || isHeightChanged) {
                console.log(`Size Changed! ${node.id}: triggers layout`); // 디버깅용
                container.update({
                    nodeId,
                    newNodeData: { width: offsetWidth, height: offsetHeight },
                });
                onRequestLayout();
            }
        }
        // 의존성 배열에서 불필요한 것 제거, node.data.contents나 width/height 값 자체를 의존
    }, [node?.width, node?.height, container, nodeId, onRequestLayout]);
    console.log("여기는 노드", node?.type, node?.id.slice(0, 4), node?.height, node?.width, node?.x, node?.y);

    if (!node) return null;

    // --- [Handlers] ---
    const handleAddChild = (e: React.MouseEvent) => {
        e.stopPropagation(); // 부모 클릭 이벤트 전파 방지
        container.appendChild({ parentNodeId: nodeId });
        onRequestLayout(); // 데이터 변경 후 레이아웃 갱신 요청
    };

    const handleDelete = (e: React.MouseEvent) => {
        e.stopPropagation();
        if (confirm("정말 삭제하시겠습니까?")) {
            container.delete({ nodeId });
            onRequestLayout();
        }
    };

    return (
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
                <button onClick={handleAddChild} style={actionBtnStyle} title="자식 추가">
                    +
                </button>

                {/* 삭제 버튼 (Root는 삭제 불가 처리) */}
                {node.type !== "root" && (
                    <button
                        onClick={handleDelete}
                        style={{ ...actionBtnStyle, background: "#ef4444", color: "white", border: "none" }}
                        title="노드 삭제"
                    >
                        ×
                    </button>
                )}
            </div>
        </div>
    );
});

MindMapNode.displayName = "MindMapNode";

// 버튼 스타일
const actionBtnStyle: React.CSSProperties = {
    width: 24,
    height: 24,
    borderRadius: "50%",
    border: "1px solid #ddd",
    background: "white",
    cursor: "pointer",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    fontSize: "14px",
    fontWeight: "bold",
    boxShadow: "0 2px 4px rgba(0,0,0,0.1)",
};
// 2. 엣지(선) 그리는 컴포넌트 (Recursive)
const MindMapEdges = ({ nodeId }: { nodeId: NodeId }) => {
    const node = useNode(nodeId);
    const { container } = useMindmapContainer();

    if (!node) return null;

    const childIds = container.getChildIds(nodeId);

    return (
        <>
            {childIds.map((childId) => (
                <Edge key={childId} parentId={nodeId} childId={childId} />
            ))}
            {childIds.map((childId) => (
                <MindMapEdges key={`rec-${childId}`} nodeId={childId} />
            ))}
        </>
    );
};

// 단일 엣지 컴포넌트
const Edge = ({ parentId, childId }: { parentId: NodeId; childId: NodeId }) => {
    const parent = useNode(parentId);
    const child = useNode(childId);

    if (!parent || !child) return null;

    // 노드의 중심점이 아닌, "오른쪽 끝" -> "왼쪽 끝" 연결
    const startX = parent.x + parent.width;
    const startY = parent.y + parent.height / 2;
    const endX = child.x;
    const endY = child.y + child.height / 2;

    // 베지어 곡선 제어점 (부드러운 S자 곡선)
    const controlPointOffset = Math.abs(endX - startX) / 2;
    const pathData = `M ${startX} ${startY} C ${startX + controlPointOffset} ${startY}, ${endX - controlPointOffset} ${endY}, ${endX} ${endY}`;

    return <path d={pathData} stroke="#cbd5e1" strokeWidth="2" fill="none" />;
};

// 3. 재귀적으로 노드를 렌더링하는 컴포넌트
const RecursiveNodeRenderer = React.memo(
    ({ nodeId, onRequestLayout }: { nodeId: NodeId; onRequestLayout: () => void }) => {
        // 1. [핵심] 전체 node가 아니라, 'childIds'만 구독합니다.
        // x, y, width가 아무리 변해도 childIds 배열이 그대로라면 이 컴포넌트는 잠잡니다.
        const childIds = useNodeSelector(nodeId, (node) =>
            // node가 없으면 빈 배열, 있으면 childIds 반환
            node ? node.childIds : [],
        );

        // 2. [최적화] 노드가 존재하지 않으면 렌더링 중단
        // useNodeSelector 내부에서 node가 없으면 처리가 되어야 하지만 안전장치
        if (!childIds) return null;

        return (
            <>
                {/* 3. 실제 그림(좌표, 스타일)을 그리는 녀석은 따로 분리 */}
                <MindMapNode nodeId={nodeId} onRequestLayout={onRequestLayout} />

                {/* 4. 자식 재귀 렌더링 */}
                {childIds.map((childId: string) => (
                    <RecursiveNodeRenderer key={childId} nodeId={childId} onRequestLayout={onRequestLayout} />
                ))}
            </>
        );
    },
);

RecursiveNodeRenderer.displayName = "RecursiveNodeRenderer";
// 4. 메인 캔버스 영역
const Canvas = () => {
    const { container } = useMindmapContainer();
    const [rootId, setRootId] = useState<NodeId | null>(null);
    const [selectedId, setSelectedId] = useState<NodeId | null>(null);

    // Layout Manager 인스턴스 생성
    const layoutManager = useMemo(() => new TreeLayoutManager(container), [container]);

    // 초기 로드 시 Root 찾기
    useEffect(() => {
        // NodeContainer 내부 구현상 iterator가 없다면, 알려진 방식(parentId === 'empty')으로 찾아야 함
        // 여기서는 편의상 container.nodeContainer Map을 직접 순회한다고 가정 (public 필드이므로)
        for (const [id, node] of container.nodeContainer) {
            if (node.type === "root") {
                setRootId(id);
                setSelectedId(id);
                break;
            }
        }
    }, [container]);

    const runLayout = useCallback(() => {
        if (rootId) {
            layoutManager.layout(rootId);
        }
    }, [rootId, layoutManager]);

    // 툴바 액션 핸들러
    const handleAddChild = () => {
        if (!selectedId) return alert("노드를 선택해주세요");

        container.appendChild({ parentNodeId: selectedId });
        // 데이터 구조 변경 후 레이아웃 갱신
        runLayout();
    };

    const handleDelete = () => {
        if (!selectedId) return;
        try {
            container.delete({ nodeId: selectedId });
            setSelectedId(rootId); // 삭제 후 루트 선택
            runLayout();
        } catch (e) {
            alert(e);
        }
    };

    const handleSelect = (e: React.MouseEvent) => {
        // 이벤트 위임 방식으로 클릭된 노드 ID 찾기 (간단 구현)
        // 실제로는 MindMapNode에 onClick을 다는게 좋음
        // 여기서는 테스트를 위해 상위에서 처리하지 않음.
    };

    if (!rootId) return <div>Loading Root...</div>;

    return (
        <div style={{ width: "100%", height: "100vh", display: "flex", flexDirection: "column" }}>
            {/* Toolbar */}
            <div
                style={{ padding: 12, borderBottom: "1px solid #ddd", display: "flex", gap: 8, background: "#f8fafc" }}
            >
                <button onClick={handleAddChild} style={btnStyle}>
                    + 자식 추가
                </button>
                <button onClick={handleDelete} style={{ ...btnStyle, color: "red" }}>
                    삭제
                </button>
                <button onClick={runLayout} style={btnStyle}>
                    🔄 레이아웃 강제 새로고침
                </button>
                <div style={{ marginLeft: "auto" }}>
                    선택된 노드: <b>{selectedId}</b>
                </div>
            </div>

            {/* Viewport */}
            <div
                style={{ flex: 1, position: "relative", overflow: "hidden", background: "#f1f5f9" }}
                onClick={(e) => {
                    // 노드 클릭 시 선택 처리 (DOM 탐색 단순화)
                    // 실제 구현시엔 Node 컴포넌트에 onClick prop 전달
                    const target = (e.target as HTMLElement).closest("[data-node-id]");
                    // 데모용 단순 ID 처리
                }}
            >
                {/* SVG Layer (Edges) */}
                <svg style={{ position: "absolute", width: "100%", height: "100%", pointerEvents: "none", zIndex: 0 }}>
                    <MindMapEdges nodeId={rootId} />
                </svg>

                {/* Node Layer */}
                {/* Node 클릭 핸들러를 주입하기 위해 Context나 Prop drilling 대신 
                    간단히 선택 로직을 Node 컴포넌트에 넣는 것이 좋으나, 
                    여기서는 RecursiveNodeRenderer 내부 구조를 유지하며 
                    선택 상태 관리를 위해 별도 컴포넌트 래핑 없이 진행합니다.
                    테스트할 땐 노드를 직접 클릭해보세요. 
                */}
                <div
                    onClick={(e) => {
                        // 간단한 이벤트 캡처링으로 선택 구현
                        // 실제 프로덕션 코드에서는 Node 컴포넌트의 Props로 handleSelect를 내리는 것이 정석입니다.
                        // 여기서는 트릭을 씁니다.
                    }}
                >
                    {/* 트릭: RecursiveNodeRenderer를 수정하여 onClick을 전달하거나, 
                       Global Event Listener를 쓰거나 해야하지만, 
                       가장 쉬운 방법은 MindMapContext에 selectedId를 넣는 것입니다. 
                       여기서는 ShowCase의 목적(레이아웃 검증)에 집중하여 
                       SelectedId 변경 로직은 아래 별도로 구현했습니다.
                     */}

                    <InteractiveTree rootId={rootId} onSelect={setSelectedId} onRequestLayout={runLayout} />
                </div>
            </div>
        </div>
    );
};

// 상호작용을 위한 래퍼 (선택 기능 추가)
const InteractiveTree = memo(({ rootId, onSelect, onRequestLayout }: any) => {
    // 재귀적으로 렌더링하되, 클릭 이벤트를 위해 DOM에 접근하지 않고
    // MindMapNode를 조금 수정해서 onClick을 받을 수 있게 하면 좋음.
    // 하지만 MindMapNode는 위에서 정의했으므로, 여기서 Context를 활용하거나
    // 아래와 같이 children prop 처럼 구현해야 함.

    // 편의상 위 MindMapNode 컴포넌트에 onClick 로직을 직접 넣지 않았으므로
    // 실제 테스트시에는 "가장 마지막에 추가된 노드"가 자동으로 선택되게 하거나
    // 아래 ModifiedRenderer를 사용.

    return <ModifiedRecursiveRenderer nodeId={rootId} onSelect={onSelect} onRequestLayout={onRequestLayout} />;
});

InteractiveTree.displayName = "InteractiveTree";

const ModifiedRecursiveRenderer = React.memo(({ nodeId, onSelect, onRequestLayout }: any) => {
    const node = useNode(nodeId);
    const { container } = useMindmapContainer();

    if (!node) return null;
    const childIds = container.getChildIds(nodeId);

    return (
        <>
            <div
                onClick={(e) => {
                    e.stopPropagation();
                    onSelect(nodeId);
                }}
            >
                <MindMapNode nodeId={nodeId} onRequestLayout={onRequestLayout} />
            </div>
            {childIds.map((childId: any) => (
                <ModifiedRecursiveRenderer
                    key={childId}
                    nodeId={childId}
                    onSelect={onSelect}
                    onRequestLayout={onRequestLayout}
                />
            ))}
        </>
    );
});

ModifiedRecursiveRenderer.displayName = "ModifiedRecursiveRenderer";
const btnStyle = {
    padding: "8px 12px",
    borderRadius: "6px",
    border: "1px solid #ccc",
    cursor: "pointer",
    background: "white",
};

// --- [Export] ---

export default function MindMapShowcase() {
    return (
        <MindMapProvider>
            <Canvas />
        </MindMapProvider>
    );
}
