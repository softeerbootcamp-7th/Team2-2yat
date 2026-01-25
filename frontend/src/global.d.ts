type Entries<T> = {
    [K in keyof T]: [K, T[K]];
}[keyof T][];

interface ObjectConstructor {
    entries<T extends object>(o: T): Entries<T>;
}
