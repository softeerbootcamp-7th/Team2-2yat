import { ComponentPropsWithoutRef, useState } from "react";
import { cva, VariantProps } from "class-variance-authority";
import { cn } from "@utils/cn";
import Icon from "@shared/components/icon/Icon";

type Status = "empty" | "writing" | "result";

type Props = ComponentPropsWithoutRef<"div"> &
    VariantProps<typeof containerVariants> & { onSearch?: (value: string) => void; placeholder?: string };

export default function Search({ onSearch, placeholder = "검색", className, ...rest }: Props) {
    const [value, setValue] = useState("");
    const [isFocused, setIsFocused] = useState(false);

    const getStatus = (): Status => {
        if (value) return "result";
        if (isFocused) return "writing";
        return "empty";
    };
    const status = getStatus();

    const handleSearch = () => {
        if (value) {
            onSearch?.(value);
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
        <div className={cn(containerVariants({ status }), className)} {...rest}>
            <button type="button" onClick={handleSearch} className={iconVariants({ status })}>
                <Icon name="ic_search" size={20} />
            </button>

            <input
                type="text"
                value={value}
                onChange={(e) => setValue(e.target.value)}
                onFocus={() => setIsFocused(true)}
                onBlur={() => setIsFocused(false)}
                onKeyDown={handleKeyDown}
                placeholder={placeholder}
                className={cn("flex-1 bg-transparent outline-none", textVariants({ status }))}
            />

            {status === "result" && (
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

const containerVariants = cva(
    "bg-base-white typo-body-14-reg flex w-225 gap-3 items-center rounded-xl border border-solid px-4 py-3 shadow-sm",
    {
        variants: {
            status: {
                empty: "border-gray-300",
                writing: "border-primary",
                result: "border-primary",
            },
        },
    },
);

const iconVariants = cva("cursor-pointer", {
    variants: {
        status: {
            empty: "text-gray-500",
            writing: "text-text-sub1",
            result: "text-text-sub1",
        },
    },
});

const textVariants = cva("flex-1 bg-transparent outline-none", {
    variants: {
        status: {
            empty: "text-gray-500",
            writing: "text-text-sub1",
            result: "text-primary-500",
        },
    },
});
