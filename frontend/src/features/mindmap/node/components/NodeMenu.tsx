import Icon, { IconName } from "@shared/components/icon/Icon";
import List from "@shared/components/list/List";
import ListGroup from "@shared/components/list/ListGroup";
import ListRow from "@shared/components/list/ListRow";
import groupBy from "@utils/groupBy";

type Props = {};

const NodeMenu = ({}: Props) => {
    return (
        <List>
            {mockOptions.map(([key, options]) => (
                <ListGroup>
                    {options.map(({ iconName, type, label }) => (
                        <ListRow
                            contents={label}
                            variant={type === "normal" ? "default" : "alert"}
                            leftSlot={<Icon name={iconName} />}
                        />
                    ))}
                </ListGroup>
            ))}
        </List>
    );
};

export default NodeMenu;

type OptionType = "normal" | "alert";
type Option = {
    label: string;
    iconName: IconName;
    type: OptionType;
};

const MOCK_OPTIONS: Option[] = [
    { label: "STAR 정리하기", iconName: "ic_writing", type: "normal" },
    { label: "하위 노드 추가하기", iconName: "ic_plus", type: "normal" },
    { label: "수정하기", iconName: "ic_nodemenu_edit", type: "normal" },
    { label: "삭제하기", iconName: "ic_nodemenu_delete", type: "alert" },
];

const mockOptions = Object.entries(groupBy({ array: MOCK_OPTIONS, keyBy: (el) => el.type }));
