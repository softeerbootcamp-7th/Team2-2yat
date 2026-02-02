type Props = {
    name: (typeof ICON_NAMES)[number];
    color?: string;
    size?: number | string;
    strokeWidth?: number | string;
    rotate?: number;
    viewBox?: string;
    width?: string | number;
    height?: string | number;
    fill?: string;
};
/**
 * size를 주면 정사각형 크기, width height를 주면 직사각형 크기로 렌더링합니다.
 */
function Icon({
    color = "currentColor",
    size = 24,
    width = size,
    height = size,
    fill,
    strokeWidth = 1.6,
    rotate = 0,
    viewBox = "0 0 24 24",
    name,
}: Props) {
    return (
        <svg
            color={color}
            width={width ? width : size}
            height={height ? height : size}
            strokeWidth={strokeWidth}
            strokeLinecap="round"
            strokeLinejoin="round"
            viewBox={viewBox}
            fill={fill ? fill : "none"}
            style={{
                transform: `rotate(${rotate}deg)`,
                transition: "transform 0.2s ease-in-out",
            }}
        >
            <use href={`/icons.svg#${name}`} />
        </svg>
    );
}

export default Icon;

export const ICON_NAMES = [
    "ic_cursor",
    "ic_star",
    "ic_star_filled",
    "ic_arrow_right",
    "ic_calendar_days",
    "ic_check_1",
    "ic_check",
    "ic_chevron_left",
    "ic_circle_check",
    "ic_copy",
    "ic_dropdown",
    "ic_ellipsis_vertical",
    "ic_ellipsis",
    "ic_filter",
    "ic_home",
    "ic_info",
    "ic_logout",
    "ic_menu",
    "ic_nodemenu_delete",
    "ic_nodemenu_edit",
    "ic_plus",
    "ic_profile",
    "ic_rotate_ccw",
    "ic_search",
    "ic_selftest",
    "ic_share",
    "ic_team",
    "ic_tool_download",
    "ic_tool_fit",
    "ic_tool_hand",
    "ic_tool_move",
    "ic_tool_postit",
    "ic_tool_scaledown",
    "ic_tool_scaleup",
    "ic_up",
    "ic_upload",
    "ic_user",
    "ic_writing",
    "ic_x_circle",
    "ic_x",
    "ic_logo",
] as const;

export type IconName = (typeof ICON_NAMES)[number];
