import { VariantProps } from "class-variance-authority";
import { ComponentPropsWithoutRef } from "react";
import { InputVariants } from "@shared/styles/input_variants";

type SingleLineInputProps = ComponentPropsWithoutRef<"input"> & VariantProps<typeof InputVariants>;

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
