import Divider from "@/shared/components/divider/Divider";

type Props = {
    label: string;
    isSelected?: boolean;
    onClick?: () => void;
};

const TabItem = ({ isSelected = false, label, onClick }: Props) => {
    return (
        <button
            onClick={onClick}
            className={`relative min-w-42 flex items-center justify-center typo-body-16-semibold transition-colors ${
                isSelected ? "text-primary" : "text-base-navy"
            }`}
        >
            {label}

            {isSelected && <Divider className="absolute -bottom-0.5 h-0.5 bg-primary" direction="x" />}
        </button>
    );
};

export default TabItem;
