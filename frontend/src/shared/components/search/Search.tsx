import { ComponentPropsWithoutRef, useState } from "react";
import { cn } from "@utils/cn";
import Icon from "@shared/components/icon/Icon";

type Props = ComponentPropsWithoutRef<"div"> & {
    onChange?: (value: string) => void;
    onSearch?: (value: string) => void;
    placeholder?: string;
};

export default function Search({ onSearch, onChange, placeholder = "검색", className, ...rest }: Props) {
    const [value, setValue] = useState("");

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const newValue = e.target.value;
        setValue(newValue);
        if (onChange) {
            onChange(newValue);
        }
    };

    const handleSearch = () => {
        if (value && onSearch) {
            onSearch(value);
        }
    };

    const handleClear = () => {
        setValue("");
    };

    const handleKeyDown = (e: React.KeyboardEvent<HTMLInputElement>) => {
        if (e.key === "Enter") {
            handleSearch();
        }
    };

    return (
        <div
            className={cn(
                "group bg-base-white typo-body-14-reg flex gap-3 items-center rounded-xl border border-solid px-4 py-3 shadow-sm w-full",
                "border-gray-300 focus-within:border-primary",
                className,
            )}
            {...rest}
        >
            <button
                type="button"
                onClick={handleSearch}
                className="cursor-pointer text-gray-500 group-focus-within:text-text-sub1"
            >
                <Icon name="ic_search" size={20} />
            </button>

            <input
                type="text"
                value={value}
                onChange={handleChange}
                onKeyDown={handleKeyDown}
                placeholder={placeholder}
                className="flex-1 bg-transparent outline-none text-text-sub1 placeholder:text-gray-500"
            />

            {value && (
                <button
                    type="button"
                    onClick={handleClear}
                    className="text-text-sub1 cursor-pointer hover:text-gray-700"
                >
                    <Icon name="ic_x" size={20} />
                </button>
            )}
        </div>
    );
}
