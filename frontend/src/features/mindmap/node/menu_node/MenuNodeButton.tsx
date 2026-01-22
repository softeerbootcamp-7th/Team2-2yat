import { cn } from "@utils/cn";
import { getColorClass } from "@features/mindmap/node/utils/colors";
import type { NodeComponentProps } from "@features/mindmap/node/types/node";
import Icon from "@shared/components/icon/Icon";

export default function MenuNodeButton({ color, className }: NodeComponentProps) {
    return (
        <div
            className={cn(
                "w-3 h-3 cursor-pointer rounded-bl-md rounded-tr-md justify-center items-center flex",
                getColorClass({ color }),
                className,
            )}
        >
            <Icon name="ic_ellipsis" size={8} color="var(--color-base-white)" />
        </div>
    );
}
