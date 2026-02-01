type Callback = () => void;
type CleanUp = () => void;

type Key = string;

export class EventBroker<T extends Key> {
    private subscribers: Map<T, Callback[]> = new Map();

    constructor() {}

    subscribe({ key, callback }: { key: T; callback: Callback }): CleanUp {
        const container = this.getCallbacks(key);

        container.push(callback);

        return () => {
            const callbacks = this.getCallbacks(key);
            if (callbacks.length === 0) {
                return;
            }

            const index = callbacks.indexOf(callback);
            if (index > -1) {
                callbacks.splice(index, 1);
            }

            if (callbacks.length === 0) {
                this.deleteKey(key);
            }
        };
    }

    private deleteKey(key: T) {
        this.subscribers.delete(key);
    }

    publish(key: T) {
        const container = this.subscribers.get(key);
        if (container) {
            container.forEach((callback) => callback());
        }
    }

    private getCallbacks(key: T): Callback[] {
        let container = this.subscribers.get(key);

        if (!container) {
            container = [];
            this.subscribers.set(key, container);
        }

        return container;
    }
}
