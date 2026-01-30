import { VariantProps } from "class-variance-authority";

export type NodeMode = "default" | "highlight" | "selected";

export type Size = "sm" | "md" | "lg";

/**
 * 1. T를 cva 함수 타입으로 제한
 * 2. VariantProps<T>가 반환하는 객체 타입을 그대로 가져오기
 * 3. Mapped Types([K in keyof ...])를 사용하여 모든 값에서 null과 undefined를 제거
 */
// eslint-disable-next-line @typescript-eslint/no-explicit-any
export type StrictVariantProps<T extends (...args: any) => any> = {
    [K in keyof VariantProps<T>]: Exclude<VariantProps<T>[K], null | undefined>;
};
