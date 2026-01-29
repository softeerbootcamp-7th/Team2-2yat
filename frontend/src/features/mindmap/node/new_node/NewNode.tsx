import { ComponentPropsWithoutRef, type ReactNode } from "react";
import { cn } from "@utils/cn";

type NewNodeProps = ComponentPropsWithoutRef<"div"> & {
    children?: ReactNode;
};

export default function NewNode({ className, children, ...rest }: NewNodeProps) {
    const content = children ?? "새로운 노드";
    return (
        <div
            {...rest}
            className={cn(
                "flex w-40 min-w-40 px-4.5 py-5 justify-center items-center gap-2.5 typo-body-14-medium rounded-xl border-2 border-gray-500 bg-white shadow-[0_0_15px_0_rgba(43,46,67,0.15)]",
                className,
            )}
        >
            {content}
        </div>
    );
}
