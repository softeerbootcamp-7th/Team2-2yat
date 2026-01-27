import { cloneElement, Children, ComponentProps, ReactElement } from "react";
import TabItem from "./TabItem";

type ChildrenType = ReactElement<ComponentProps<typeof TabItem>>;

type Props = {
    children: ChildrenType | ChildrenType[];
    onChange: (index: number) => void;
    selectedIndex: number;
};

const TabComponent = ({ children, onChange, selectedIndex }: Props) => {
    return (
        <div className="w-full flex border-b-2 border-gray-200 h-12.5">
            {Children.map(children, (child, index) => {
                if (!child) return null;

                return cloneElement(child, {
                    onClick: () => onChange(index),
                    isSelected: index === selectedIndex,
                });
            })}
        </div>
    );
};

const Tab = Object.assign(TabComponent, {
    Item: TabItem,
});

export default Tab;
