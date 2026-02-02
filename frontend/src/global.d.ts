type Entries<T> = {
    [K in keyof T]: [K, T[K]];
}[keyof T][];

type ObjectConstructor = {
    entries<T extends object>(o: T): Entries<T>;
    keys<T extends object>(o: T): (keyof T)[];
};
