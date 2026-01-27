import Icon from "@shared/components/icon/Icon";

export default function Profile(name: string) {
    return (
        <div className="flex items-center gap-4">
            <Icon name="ic_profile" color="var(--color-primary)" size={35} />
            <span className="typo-body-16-medium pr-3">{name}님</span>
        </div>
    );
}
