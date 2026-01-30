import { useState } from "react";

type Props = {
    defaultValue?: boolean;
};

const useToggle = ({ defaultValue = false }: Props = {}) => {
    const [isToggled, setIsToggled] = useState(defaultValue);

    const actionHandler = {
        on: () => setIsToggled(true),
        off: () => setIsToggled(false),
        toggle: () => setIsToggled((prev) => !prev),
    };

    return [isToggled, actionHandler] as const;
};

export default useToggle;
