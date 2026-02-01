import React, { useMemo, useState } from "react";

import { MindMapProvider, useMindmapContainer, useNode } from "@/features/mindmap/providers/NodeContainerProvider";

// 스타일: 노드 구분을 위해 간단한 스타일 정의
const styles = {
    nodeContainer: {
        padding: "10px",
        margin: "5px 0",
        border: "1px solid #ccc",
        borderRadius: "8px",
        backgroundColor: "#fff",
        transition: "all 0.2s",
    },
    rootNode: {
        backgroundColor: "#e3f2fd",
        borderColor: "#2196f3",
    },
    dragging: {
        opacity: 0.5,
        border: "1px dashed #999",
    },
    dragOver: {
        backgroundColor: "#e8f5e9",
        border: "1px solid #4caf50",
    },
    btnGroup: {
        marginTop: "8px",
        display: "flex",
        gap: "4px",
    },
    btn: {
        padding: "4px 8px",
        fontSize: "12px",
        cursor: "pointer",
    },
    childrenArea: {
        marginLeft: "24px",
        borderLeft: "1px solid #eee",
        paddingLeft: "12px",
    },
};

// ----------------------------------------------------------------------
// 1. 개별 노드 뷰 (재귀 컴포넌트)
// ----------------------------------------------------------------------
const NodeView = React.memo(({ nodeId }: { nodeId: string }) => {
    const node = useNode(nodeId);
    const { container } = useMindmapContainer();

    // 드래그 앤 드롭 상태
    const [isDragOver, setIsDragOver] = useState(false);

    // 자식 ID 목록 계산 (구독된 node가 변할 때만 재계산)
    const childIds = useMemo(() => {
        return container.getChildIds(nodeId);
    }, [node, container, nodeId]);

    if (!node) return null; // 삭제된 경우

    const isRoot = node.type === "root";

    // --- 핸들러 ---

    const handleAddChild = () => container.appendChild({ parentNodeId: nodeId });

    const handleAddPrev = () => container.attachTo({ baseNodeId: nodeId, direction: "prev" });

    const handleAddNext = () => container.attachTo({ baseNodeId: nodeId, direction: "next" });

    const handleDelete = () => {
        if (confirm("정말 삭제하시겠습니까?")) {
            container.delete({ nodeId });
        }
    };

    // --- DnD 핸들러 (HTML5 Native) ---

    const onDragStart = (e: React.DragEvent) => {
        e.stopPropagation();
        // 드래그 시작 시 내 ID를 저장
        e.dataTransfer.setData("nodeId", nodeId);
        e.dataTransfer.effectAllowed = "move";
    };

    const onDragOver = (e: React.DragEvent) => {
        e.preventDefault(); // Drop 허용을 위해 필수
        e.stopPropagation();
        if (!isDragOver) setIsDragOver(true);
    };

    const onDragLeave = (e: React.DragEvent) => {
        e.preventDefault();
        e.stopPropagation();
        setIsDragOver(false);
    };

    const onDrop = (e: React.DragEvent) => {
        e.preventDefault();
        e.stopPropagation();
        setIsDragOver(false);

        const movingNodeId = e.dataTransfer.getData("nodeId");
        if (movingNodeId === nodeId) return;

        console.log(`Move: ${movingNodeId} -> Into ${nodeId}`);

        container.moveTo({
            baseNodeId: nodeId, // 타겟 노드 (부모가 될 녀석)
            movingNodeId: movingNodeId, // 이동할 노드
            direction: "child",
        });
    };

    return (
        <div
            style={{
                ...styles.nodeContainer,
                ...(isRoot ? styles.rootNode : {}),
                ...(isDragOver ? styles.dragOver : {}),
            }}
            draggable={!isRoot} // 루트는 드래그 불가
            onDragStart={onDragStart}
            onDragOver={onDragOver}
            onDragLeave={onDragLeave}
            onDrop={onDrop}
        >
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                <div>
                    <strong>{isRoot ? "ROOT" : "NODE"}</strong>
                    <span style={{ marginLeft: 8, color: "#666", fontSize: "0.8em" }}>({node.id.slice(0, 4)}...)</span>
                    <div style={{ fontSize: "14px" }}>{node.data.contents || "내용 없음"}</div>
                </div>

                {/* 조작 버튼들 */}
                <div style={styles.btnGroup}>
                    <button style={styles.btn} onClick={handleAddChild}>
                        + 자식
                    </button>
                    {!isRoot && (
                        <>
                            <button style={styles.btn} onClick={handleAddPrev}>
                                ↑ 위 추가
                            </button>
                            <button style={styles.btn} onClick={handleAddNext}>
                                ↓ 아래 추가
                            </button>
                            <button
                                style={{
                                    ...styles.btn,
                                    backgroundColor: "#ffebee",
                                    color: "#c62828",
                                    border: "1px solid #ffcdd2",
                                }}
                                onClick={handleDelete}
                            >
                                삭제
                            </button>
                        </>
                    )}
                </div>
            </div>

            {/* 자식 영역 (재귀) */}
            {childIds.length > 0 && (
                <div style={styles.childrenArea}>
                    {childIds.map((childId) => (
                        <NodeView key={childId} nodeId={childId} />
                    ))}
                </div>
            )}
        </div>
    );
});

NodeView.displayName = "NodeView";

export default function MindMapShowCase() {
    return (
        <MindMapProvider>
            <div style={{ padding: "40px", maxWidth: "800px", margin: "0 auto", fontFamily: "sans-serif" }}>
                <h1>MindMap Logic Tester</h1>
                <p style={{ color: "#666", marginBottom: "20px" }}>
                    - <b>+ 자식</b>: 하위 노드 추가
                    <br />- <b>위/아래 추가</b>: 형제 노드 추가
                    <br />- <b>Drag & Drop</b>: 노드를 잡아 다른 노드 위에 놓으면, 그 노드의 <u>다음 형제</u>로
                    이동합니다.
                </p>

                {/* 루트 노드 렌더링 시작 */}
                {/* NodeContainer 생성자에서 만든 Root ID를 넣어줘야 함. 
                    보통은 container.getRootId() 같은게 필요하지만, 
                    여기서는 우리가 코드로 작성한 rootNodeElement의 ID를 알거나, 
                    container 내부 구현상 첫 번째 set된 녀석이 root일 것임.
                    
                    테스트를 위해 NodeContainer 코드 상단의 ROOT_NODE_ID 값이 있다면 그걸 쓰거나
                    여기서는 편의상 NodeContainer 생성 시 만든 rootId를 알아야 하는데,
                    일단 NodeContainer가 생성자에서 root를 만들고 있으니
                    'root' 라는 ID를 가질 확률이 높음 (이전 코드에서 nanoid() 썼는지 확인 필요).
                    
                    만약 NodeContainer 생성자 코드가 다음과 같다면:
                    const rootNodeElement = ... id: 'root' ...
                    그러면 아래처럼 'root'를 쓰면 됩니다.
                */}
                <RootEntry />
            </div>
        </MindMapProvider>
    );
}

// 루트 ID를 찾아서 그리기 위한 래퍼
const RootEntry = () => {
    const { container } = useMindmapContainer();
    // 실제 구현에서는 container.getRoot() 같은 메서드가 있으면 좋음.
    // 여기서는 Container 생성자 로직을 믿고, container 내부 Map을 순회해서 type:root를 찾거나
    // NodeContainer 코드에서 Root ID를 고정('root')했다면 그걸 씁니다.

    // 임시: 모든 노드 중 root 타입 찾기 (테스트용)
    // 실제 프로덕션엔 getRootId() 메서드를 만드세요.
    const rootId = useMemo(() => {
        const map = container.nodeContainer;
        for (const [id, node] of map.entries()) {
            if (node.type === "root") return id;
        }

        console.log("hi");
        return null;
    }, [container]);

    if (!rootId) return <div>Root Node Not Found</div>;

    return <NodeView nodeId={rootId} />;
};
