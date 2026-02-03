type Callback = () => void;
type CleanUp = () => void;
type Key = string;

export class EventBroker<T extends Key> {
    // Array 대신 Set을 사용하여 중복 방지 및 삭제 최적화
    private subscribers: Map<T, Set<Callback>> = new Map();

    subscribe({ key, callback }: { key: T; callback: Callback }): CleanUp {
        const container = this.getCallbacks(key);
        container.add(callback);

        return () => {
            const container = this.subscribers.get(key);
            if (!container) return;

            container.delete(callback);

            if (container.size === 0) {
                this.subscribers.delete(key);
            }
        };
    }

    publish(key: T) {
        const container = this.subscribers.get(key);
        if (container) {
            // 실행 도중 container가 변경될 수 있으므로 복사본으로 순회하는 것이 안전합니다.
            [...container].forEach((callback) => callback());
        }
    }

    private getCallbacks(key: T): Set<Callback> {
        let container = this.subscribers.get(key);
        if (!container) {
            container = new Set();
            this.subscribers.set(key, container);
        }
        return container;
    }
}
