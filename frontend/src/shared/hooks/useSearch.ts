import { useState } from "react";

export type UseSearchParams = {
    onSearchChange?: (value: string) => void;
    onSearchSubmit?: (value: string) => void;
};

export default function useSearch({ onSearchChange, onSearchSubmit }: UseSearchParams = {}) {
    const [value, setValue] = useState("");

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const newValue = e.target.value;
        setValue(newValue);
        if (onSearchChange) {
            onSearchChange(newValue);
        }
    };

    const handleSearch = () => {
        if (value && onSearchSubmit) {
            onSearchSubmit(value);
        }
    };

    const handleClear = () => {
        setValue("");
    };

    const handleKeyDown = (e: React.KeyboardEvent<HTMLInputElement>) => {
        if (e.key !== "Enter") return;

        if (e.nativeEvent.isComposing) return;
        e.preventDefault();
        handleSearch();
    };

    return {
        value,
        handleChange,
        handleSearch,
        handleClear,
        handleKeyDown,
    };
}
