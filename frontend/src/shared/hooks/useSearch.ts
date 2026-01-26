import { useState } from "react";

type UseSearchParams = {
    onChange?: (value: string) => void;
    onSearch?: (value: string) => void;
};

export default function useSearch({ onChange, onSearch }: UseSearchParams = {}) {
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

    return {
        value,
        handleChange,
        handleSearch,
        handleClear,
        handleKeyDown,
    };
}
