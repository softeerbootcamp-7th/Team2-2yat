import { cva } from "class-variance-authority";
import { ComponentPropsWithoutRef } from "react";

const InputVariants = cva(
    "bg-base-white border border-solid border-gray-300 rounded-xl p-4 justify-start items-start focus:border-(--color-primary) focus:outline-none",
    {
        variants: {
            inputSize: {
                sm: "h-12 typo-body-14-medium",
                md: "w-105 min-h-30 typo-body-14-reg resize-none",
                lg: "w-200.5 min-h-30 typo-body-14-reg resize-none",
                full: "w-full min-h-30 typo-body-14-reg resize-none",
            },
            status: {
                empty: "text-text-placeholder",
                filled: "text-text-main1",
            },
        },
    },
);

type InputSize = "sm" | "md" | "lg" | "full";

type SingleLineInputProps = ComponentPropsWithoutRef<"input"> & {
    inputSize?: InputSize;
};
type MultilineInputProps = ComponentPropsWithoutRef<"textarea"> & {
    inputSize?: InputSize;
};

const MAX_LENGTH = 43;

function Input({ placeholder, value, inputSize = "full", ...rest }: SingleLineInputProps) {
    const status = value ? "filled" : "empty";
    return (
        <input
            className={InputVariants({ inputSize, status })}
            placeholder={placeholder}
            value={value || ""}
            maxLength={MAX_LENGTH}
            {...rest}
        />
    );
}

function TextArea({ placeholder, value, inputSize = "full", ...rest }: MultilineInputProps) {
    const status = value ? "filled" : "empty";

    return (
        <textarea
            className={InputVariants({ inputSize, status })}
            placeholder={placeholder}
            value={value || ""}
            {...rest}
        />
    );
}

export { Input, TextArea };
