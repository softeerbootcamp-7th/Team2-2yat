import { cva, type VariantProps } from "class-variance-authority";
import { ComponentPropsWithoutRef } from "react";

import Icon from "@/shared/components/icon/Icon";
import { cn } from "@/utils/cn";

const nodeVariants = cva("w-5.5 h-5.5 cursor-pointer rounded-bl-xl rounded-tr-lg justify-center items-center flex", {
    variants: {
        color: {
            violet: "bg-node-violet-op-100",
            blue: "bg-node-blue-op-100",
            skyblue: "bg-node-skyblue-op-100",
            mint: "bg-node-mint-op-100",
            cyan: "bg-node-cyan-op-100",
            purple: "bg-node-purple-op-100",
            magenta: "bg-node-magenta-op-100",
            navy: "bg-node-navy-op-100",
        },
    },
});

type Props = ComponentPropsWithoutRef<"button"> & VariantProps<typeof nodeVariants> & {};

export default function MenuNodeButton({ color, className, ...rest }: Props) {
    return (
        <button className={cn(nodeVariants({ color }), className)} {...rest}>
            <Icon name="ic_ellipsis" size={16} color="var(--color-base-white)" />
        </button>
    );
}
