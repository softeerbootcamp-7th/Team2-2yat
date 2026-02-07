type Callback = () => void;
type CleanUp = () => void;
type Key = string;

export class EventBroker<T extends Key> {
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
