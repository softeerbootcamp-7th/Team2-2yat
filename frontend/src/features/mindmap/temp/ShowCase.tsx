// TreeShowCase. move할 때.리렌더링 문제가 있음.

import React, { memo, useCallback, useEffect, useLayoutEffect, useMemo, useRef, useState } from "react";

import {
    MindMapProvider,
    useMindmapActions,
    useMindmapContainer,
    useMindmapVersion,
    useNode,
} from "@/features/mindmap/providers/MindmapProvider";

const GridLayer = memo(({ transform }: { transform: { x: number; y: number; scale: number } }) => {
    const gridSize = 100;

    // 현재 화면에 보일 숫자의 범위를 더 넉넉하게 잡습니다.
    // 캔버스 이동 거리가 멀어지면 labels가 더 많이 필요할 수 있습니다.
    const labels = useMemo(() => {
        const temp = [];
        for (let i = -50; i <= 50; i++) {
            temp.push(i * gridSize);
        }
        return temp;
    }, []);

    return (
        <svg
            style={{
                position: "absolute",
                top: 0,
                left: 0,
                width: "100%",
                height: "100%",
                pointerEvents: "none",
                backgroundColor: "#f8fafc", // 배경색을 여기다 직접 줍니다.
                zIndex: 0, // 너무 낮으면 안 보일 수 있으니 0으로 조절
            }}
        >
            <defs>
                {/* 1. 패턴 자체에 scale을 적용하지 않고, rect를 그릴 때 transform을 활용합니다 */}
                <pattern id="gridPattern" width={gridSize} height={gridSize} patternUnits="userSpaceOnUse">
                    {/* 작은 격자 */}
                    {[10, 20, 30, 40, 50, 60, 70, 80, 90].map((pos) => (
                        <React.Fragment key={pos}>
                            <line x1={pos} y1="0" x2={pos} y2={gridSize} stroke="#e2e8f0" strokeWidth="0.5" />
                            <line x1="0" y1={pos} x2={gridSize} y2={pos} stroke="#e2e8f0" strokeWidth="0.5" />
                        </React.Fragment>
                    ))}
                    {/* 큰 격자 테두리 */}
                    <path d={`M ${gridSize} 0 L 0 0 0 ${gridSize}`} fill="none" stroke="#cbd5e1" strokeWidth="1" />
                </pattern>
            </defs>

            {/* 2. 격자 배경: 캔버스의 이동/확대와 동기화 */}
            <g transform={`translate(${transform.x}, ${transform.y}) scale(${transform.scale})`}>
                {/* 격자 무늬를 엄청 크게 그려서 끊기지 않게 함 */}
                <rect x="-5000" y="-5000" width="10000" height="10000" fill="url(#gridPattern)" />

                {/* 좌표축 가이드 라인 (0,0 기준) */}
                <line x1="-5000" y1="0" x2="5000" y2="0" stroke="#94a3b8" strokeWidth="2" strokeDasharray="4" />
                <line x1="0" y1="-5000" x2="0" y2="5000" stroke="#94a3b8" strokeWidth="2" strokeDasharray="4" />

                {/* 숫자 라벨 */}
                {labels.map((val) => (
                    <React.Fragment key={val}>
                        {/* X축 숫자 (y=0 지점 근처) */}
                        <text
                            x={val}
                            y={20}
                            fontSize={12 / transform.scale} // 스케일에 맞춰 폰트 크기 보정 (선택사항)
                            fill="#64748b"
                            textAnchor="middle"
                        >
                            {val}
                        </text>
                        {/* Y축 숫자 (x=0 지점 근처) */}
                        <text x={10} y={val} fontSize={12 / transform.scale} fill="#64748b" dominantBaseline="middle">
                            {val}
                        </text>
                    </React.Fragment>
                ))}
            </g>
        </svg>
    );
});

GridLayer.displayName = "GridLayer";

const Edge = memo(({ fromId, toId, parentId }: { fromId: string; toId: string; parentId: string }) => {
    const fromNode = useNode(fromId);
    const toNode = useNode(toId);

    if (!fromNode || !toNode || !fromNode.width || !toNode.width) return null;

    const startX = fromNode.x + fromNode.width;
    const startY = fromNode.y + fromNode.height / 2;
    const endX = toNode.x;
    const endY = toNode.y + toNode.height / 2;

    const controlPointX = startX + (endX - startX) / 2;
    const pathData = `M ${startX} ${startY} C ${controlPointX} ${startY}, ${controlPointX} ${endY}, ${endX} ${endY}`;

    return (
        <path
            d={pathData}
            fill="none"
            stroke="#cbd5e1"
            strokeWidth="2"
            strokeLinecap="round"
            style={{
                // [핵심] d 속성(경로)이 바뀔 때 애니메이션 적용
                // NodeView의 transition 설정과 시간을 맞춰야 선이 노드를 놓치지 않고 따라갑니다.
                transition: "d 0.3s cubic-bezier(0.25, 0.8, 0.25, 1)",

                // (선택 사항) 만약 색상 변경 같은 것도 있다면 all로 해도 됩니다.
                // transition: "all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1)",
            }}
        />
    );
});
Edge.displayName = "Edge";

const EdgeLayer = () => {
    const container = useMindmapContainer(); // Stable
    const version = useMindmapVersion();

    const edgePairs = useMemo(() => {
        return Array.from(container.nodes.keys()).flatMap((parentId) => {
            const children = container.getChildIds(parentId);
            return children.map((childId) => ({
                id: `${parentId}-${childId}`,
                fromId: parentId,
                toId: childId,
                parentId: parentId,
            }));
        });
    }, [container.nodes.size, version]); // version이 바뀌면 엣지 다시 그리기

    return (
        <svg
            style={{
                position: "absolute",
                top: 0,
                left: 0,
                width: "1px",
                height: "1px",
                overflow: "visible",
                pointerEvents: "none",
                zIndex: 0,
            }}
        >
            {edgePairs.map((edge) => (
                <Edge key={edge.id} fromId={edge.fromId} toId={edge.toId} parentId={edge.parentId} />
            ))}
        </svg>
    );
};
EdgeLayer.displayName = "EdgeLayer";

const NodeView = memo(
    ({
        nodeId,
        onDragStart,
        dragSubtreeIds,
        dragDelta,
    }: {
        nodeId: string;
        onDragStart: (e: React.MouseEvent, id: string) => void;
        dragSubtreeIds: Set<string> | null;
        dragDelta: { x: number; y: number };
    }) => {
        const node = useNode(nodeId); // Stable Context 사용 -> Version 변경 시 리렌더링 X
        const { addNode, deleteNode, updateNodeSize } = useMindmapActions(); // Stable Context 사용 -> 리렌더링 X
        const ref = useRef<HTMLDivElement>(null);

        if (!node) return null;

        useLayoutEffect(() => {
            if (ref.current && node) {
                const { offsetWidth, offsetHeight } = ref.current;
                // 액션 호출 (내부에서 container update + layout invalidate + runLayout 다 해줌)
                updateNodeSize(nodeId, offsetWidth, offsetHeight);
            }
        }, [node?.width, node?.height, nodeId]);

        const isDraggingGroup = dragSubtreeIds?.has(nodeId);
        const currentX = isDraggingGroup ? node.x + dragDelta.x : node.x;
        const currentY = isDraggingGroup ? node.y + dragDelta.y : node.y;

        return (
            <div
                ref={ref}
                className="node-group"
                data-node-id={nodeId}
                onMouseDown={(e) => {
                    if (node.type === "root") return;
                    onDragStart(e, nodeId);
                }}
                style={{
                    position: "absolute",
                    transform: `translate(${currentX}px, ${currentY}px)`,
                    transition: isDraggingGroup ? "none" : "transform 0.3s cubic-bezier(0.25, 0.8, 0.25, 1)",
                    // ... (스타일 유지) ...
                    padding: "8px 16px",
                    border: `2px solid ${node.type === "root" ? "#3b82f6" : "#cbd5e1"}`,
                    backgroundColor: node.type === "root" ? "#eff6ff" : "white",
                    borderRadius: "8px",
                    whiteSpace: "nowrap",
                    cursor: node.type === "root" ? "default" : "grab",
                    pointerEvents: isDraggingGroup ? "none" : "auto",
                    zIndex: isDraggingGroup ? 1000 : 1,
                    boxShadow: isDraggingGroup
                        ? "0 20px 25px -5px rgb(0 0 0 / 0.1)"
                        : "0 4px 6px -1px rgb(0 0 0 / 0.1)",
                }}
            >
                <div className="select-none" style={{ fontWeight: 600 }}>
                    {node.id.slice(0, 4)}asdfasdf
                </div>

                <div
                    className="action-buttons"
                    style={{
                        position: "absolute",
                        top: "-12px",
                        right: "-12px",
                        display: "flex",
                        gap: "4px",
                        zIndex: 100,
                    }}
                >
                    <button
                        onMouseDown={(e) => e.stopPropagation()}
                        onClick={(e) => {
                            e.stopPropagation();
                            addNode(nodeId); // 👈 간단하게 호출
                        }}
                        style={buttonStyle("#3b82f6")}
                        title="자식 추가"
                    >
                        +
                    </button>

                    {node.type !== "root" && (
                        <button
                            onMouseDown={(e) => e.stopPropagation()}
                            onClick={(e) => {
                                e.stopPropagation();
                                if (confirm("삭제?")) deleteNode(nodeId); // 👈 간단하게 호출
                            }}
                            style={buttonStyle("#ef4444")}
                            title="노드 삭제"
                        >
                            ×
                        </button>
                    )}
                </div>
            </div>
        );
    },
);
NodeView.displayName = "NodeView";

export default function MindMapShowcase() {
    return (
        <MindMapProvider>
            <Canvas />
        </MindMapProvider>
    );
}

const Canvas = () => {
    const container = useMindmapContainer(); // Stable
    const version = useMindmapVersion(); // Unstable (노드 추가/삭제 감지용)
    const { moveNode, forceLayout } = useMindmapActions();

    // Zoom & Pan 상태
    const [transform, setTransform] = useState({ x: 0, y: 0, scale: 1 });
    const containerRef = useRef<HTMLDivElement>(null);

    // 드래그 상태
    const [draggingNodeId, setDraggingNodeId] = useState<string | null>(null);
    const [dragSubtreeIds, setDragSubtreeIds] = useState<Set<string> | null>(null);
    const [dragDelta, setDragDelta] = useState({ x: 0, y: 0 });
    const [dragStartPos, setDragStartPos] = useState({ x: 0, y: 0 });

    const allNodeIds = useMemo(() => Array.from(container.nodes.keys()), [container.nodes.size, version]);

    useEffect(() => {
        forceLayout();
    }, [forceLayout]);

    const rootId = useMemo(() => {
        for (const [id, node] of container.nodes.entries()) {
            if (node.type === "root") return id;
        }
        return null;
    }, [container]);

    const handleWheel = useCallback((e: React.WheelEvent) => {
        const zoomSpeed = 0.001;
        const minScale = 0.1;
        const maxScale = 3;

        setTransform((prev) => {
            const delta = -e.deltaY * zoomSpeed;
            const newScale = Math.min(Math.max(prev.scale + delta, minScale), maxScale);

            return { ...prev, scale: newScale };
        });
    }, []);

    const handleMouseDown = useCallback(
        (e: React.MouseEvent) => {
            if (e.target !== e.currentTarget) return;

            const startX = e.clientX - transform.x;
            const startY = e.clientY - transform.y;

            const onMouseMove = (moveEvent: MouseEvent) => {
                setTransform((prev) => ({
                    ...prev,
                    x: moveEvent.clientX - startX,
                    y: moveEvent.clientY - startY,
                }));
            };

            const onMouseUp = () => {
                document.removeEventListener("mousemove", onMouseMove);
                document.removeEventListener("mouseup", onMouseUp);
            };

            document.addEventListener("mousemove", onMouseMove);
            document.addEventListener("mouseup", onMouseUp);
        },
        [transform.x, transform.y],
    );

    const onDragStart = useCallback(
        (e: React.MouseEvent, id: string) => {
            e.stopPropagation();
            const subtreeIds = container.getAllDescendantIds(id);
            setDraggingNodeId(id);
            setDragSubtreeIds(subtreeIds);

            const startX = (e.clientX - transform.x) / transform.scale;
            const startY = (e.clientY - transform.y) / transform.scale;
            setDragStartPos({ x: startX, y: startY });
            setDragDelta({ x: 0, y: 0 });
        },
        [container, transform],
    );

    useEffect(() => {
        if (!draggingNodeId) return;

        const onMouseMove = (e: MouseEvent) => {
            const currentX = (e.clientX - transform.x) / transform.scale;
            const currentY = (e.clientY - transform.y) / transform.scale;
            setDragDelta({ x: currentX - dragStartPos.x, y: currentY - dragStartPos.y });
        };

        const onMouseUp = (e: MouseEvent) => {
            const elements = document.elementsFromPoint(e.clientX, e.clientY);
            const targetElement = elements.find((el) => el.hasAttribute("data-node-id"));

            if (targetElement) {
                const targetNodeId = targetElement.getAttribute("data-node-id")!;
                if (targetNodeId !== draggingNodeId) {
                    try {
                        moveNode(targetNodeId, draggingNodeId);
                    } catch (err) {
                        console.error("이동 불가:", err);
                    }
                }
            }
            setDraggingNodeId(null);
            setDragSubtreeIds(null);
            setDragDelta({ x: 0, y: 0 });

            document.removeEventListener("mousemove", onMouseMove);
            document.removeEventListener("mouseup", onMouseUp);
        };

        document.addEventListener("mousemove", onMouseMove);
        document.addEventListener("mouseup", onMouseUp);
        return () => {
            document.removeEventListener("mousemove", onMouseMove);
            document.removeEventListener("mouseup", onMouseUp);
        };
    }, [draggingNodeId, dragStartPos, transform, moveNode]);

    if (!rootId) return <div>Loading...</div>;

    return (
        <div
            ref={containerRef}
            onWheel={handleWheel}
            onMouseDown={handleMouseDown}
            style={{
                position: "relative",
                width: "100%",
                height: "100vh",
                overflow: "hidden",
                cursor: "grab",
                backgroundColor: "#f8fafc",
                touchAction: "none",
            }}
        >
            <GridLayer transform={transform} />
            <div
                style={{
                    transform: `translate(${transform.x}px, ${transform.y}px) scale(${transform.scale})`,
                    transformOrigin: "0 0",
                    transition: "none",
                    width: "100%",
                    height: "100%",
                    pointerEvents: "none",
                }}
            >
                <div style={{ pointerEvents: "auto" }}>
                    <EdgeLayer />
                    {allNodeIds.map((nodeId) => (
                        <NodeView
                            key={nodeId}
                            nodeId={nodeId}
                            onDragStart={onDragStart}
                            dragSubtreeIds={dragSubtreeIds}
                            dragDelta={dragDelta}
                        />
                    ))}
                </div>
            </div>
            <div
                style={{
                    position: "absolute",
                    bottom: 20,
                    right: 20,
                    background: "white",
                    padding: 8,
                    borderRadius: 8,
                    fontSize: 20,
                    boxShadow: "0 2px 4px rgba(0,0,0,0.1)",
                }}
            >
                노드를 drag & drop으로 이동할 수 있습니다.
                <br />
                + 버튼을 눌러 노드를 추가할 수 있습니다.
                <br />
                zoom, pan을 할 수 있습니다.
                <br />
                Zoom: {Math.round(transform.scale * 100)}% | Pan: Click & Drag
            </div>
        </div>
    );
};

const buttonStyle = (color: string) => ({
    width: "24px",
    height: "24px",
    borderRadius: "50%",
    border: "none",
    backgroundColor: color,
    color: "white",
    fontSize: "16px",
    fontWeight: "bold",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    cursor: "pointer",
    boxShadow: "0 2px 4px rgba(0,0,0,0.2)",
    padding: 0,
    lineHeight: 1,
});
