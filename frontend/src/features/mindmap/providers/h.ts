import { useCallback, useRef, useSyncExternalStore } from "react";

import { useMindmapContainer } from "@/features/mindmap/providers/NodeContainerProvider";
import { NodeId } from "@/features/mindmap/types/mindmapType";

export function shallowEqual<T>(objA: T, objB: T): boolean {
    if (Object.is(objA, objB)) {
        return true;
    }

    if (typeof objA !== "object" || objA === null || typeof objB !== "object" || objB === null) {
        return false;
    }

    const keysA = Object.keys(objA);
    const keysB = Object.keys(objB);

    if (keysA.length !== keysB.length) {
        return false;
    }

    for (let i = 0; i < keysA.length; i++) {
        const key = keysA[i];
        if (!Object.prototype.hasOwnProperty.call(objB, key) || !Object.is((objA as any)[key], (objB as any)[key])) {
            return false;
        }
    }

    return true;
}

export const useNodeSelector = <T>(
    nodeId: NodeId,
    selector: (node: any | undefined) => T,
    equalityFn: (a: T, b: T) => boolean = shallowEqual,
): T => {
    const { container, broker } = useMindmapContainer();

    // 1. 마지막으로 계산된 결과를 저장할 Ref (메모이제이션용)
    const selectionRef = useRef<T>(selector(container.safeGetNode(nodeId)));

    // 2. 구독 함수 (Store 변경 감지)
    const subscribe = useCallback(
        (onStoreChange: () => void) => {
            return broker.subscribe({ key: nodeId, callback: onStoreChange });
        },
        [broker, nodeId],
    );

    // 3. 스냅샷 가져오기 (핵심: 결과가 동등하면 이전 Ref 반환)
    const getSnapshot = () => {
        // 현재 노드 상태 가져오기
        const node = container.safeGetNode(nodeId);
        // 사용자가 원하는 데이터만 추출 (예: { x, y })
        const nextSelection = selector(node);

        // 이전 값과 비교 (equalityFn 사용)
        // 값이 같다면 리렌더링을 막기 위해 '기존 참조(selectionRef.current)'를 반환해야 함
        if (equalityFn(selectionRef.current, nextSelection)) {
            return selectionRef.current;
        }

        // 값이 다르면 Ref 업데이트 후 새 값 반환 -> 리렌더링 트리거
        selectionRef.current = nextSelection;
        return nextSelection;
    };

    return useSyncExternalStore(subscribe, getSnapshot);
};
