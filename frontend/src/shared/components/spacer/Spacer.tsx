import { CSSProperties } from "react";

type Props = {
    x?: number | string;
    y?: number | string;
    flex?: boolean;
};

const Spacer = ({ x, y, flex }: Props) => {
    // 디자인 상 space가 규칙이 없으므로 많은 케이스를 수용할 수 있게 inline style을 사용하였습니다.
    const style: CSSProperties = {
        width: x ? (typeof x === "number" ? `${x * 0.25}rem` : x) : undefined,
        height: y ? (typeof y === "number" ? `${y * 0.25}rem` : y) : undefined,
        flexShrink: 0,
    };

    return <div style={style} className={`${flex ? "flex-1" : "flex-none"}`} aria-hidden="true" />;
};

export default Spacer;
