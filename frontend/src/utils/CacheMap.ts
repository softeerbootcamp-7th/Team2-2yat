export class CacheMap<Key, Value> {
    private cache: Map<Key, Value> = new Map();
    private defaultValue: Value;

    constructor(defaultValue: Value) {
        this.defaultValue = defaultValue;
    }

    get(key: Key): Value {
        if (this.cache.has(key)) {
            return this.cache.get(key) as Value;
        }

        this.cache.set(key, this.defaultValue);

        return this.defaultValue;
    }

    set(key: Key, value: Value) {
        this.cache.set(key, value);
    }

    delete(key: Key) {
        this.cache.delete(key);
    }

    has(key: Key) {
        return this.cache.has(key);
    }
}
