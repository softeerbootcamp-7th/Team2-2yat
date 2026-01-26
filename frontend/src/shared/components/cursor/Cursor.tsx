import Icon from "@shared/components/icon/Icon";

type Props = {
    name?: string;
    colorIndex?: number;
};

const Cursor = ({ colorIndex = 0, name }: Props) => {
    const colorKey = COLORS[colorIndex % COLORS.length];
    const colorStyle = COLOR_MAP[colorKey];

    return (
        <div className={`relative  ${colorStyle.text}`}>
            <Icon name="ic_cursor" size={30} />

            {name && (
                <div
                    className={`shadow-lg absolute top-4 left-3 py-2 px-2.5 rounded-xl text-white typo-caption-11-reg ${colorStyle.bg} max-w-25 truncate whitespace-nowrap`}
                >
                    {name}
                </div>
            )}
        </div>
    );
};

export default Cursor;

const COLOR_MAP = {
    blue: { text: "text-cursor-blue", bg: "bg-cursor-blue" },
    pink: { text: "text-cursor-pink", bg: "bg-cursor-pink" },
    green: { text: "text-cursor-green", bg: "bg-cursor-green" },
    purple: { text: "text-cursor-purple", bg: "bg-cursor-purple" },
    orange: { text: "text-cursor-orange", bg: "bg-cursor-orange" },
};
const COLORS = Object.keys(COLOR_MAP);
