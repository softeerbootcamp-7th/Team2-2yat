import { VariantProps } from "class-variance-authority";

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export type SafeVariantProps<T extends (...args: any) => any> = {
    [K in keyof VariantProps<T>]: Exclude<VariantProps<T>[K], null>;
};
