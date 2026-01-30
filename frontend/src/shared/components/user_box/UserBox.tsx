import { ComponentPropsWithoutRef } from "react";

import Icon from "@/shared/components/icon/Icon";

type Props = ComponentPropsWithoutRef<"div"> & {
    name: string;
};

export default function UserBox({ name, ...rest }: Props) {
    return (
        <div className="flex items-center gap-4" {...rest}>
            <Icon name="ic_profile" color="var(--color-primary)" size={35} />
            <span className="typo-body-16-medium pr-3">{name}님</span>
        </div>
    );
}
