import { InputVariants } from "@shared/styles/input_variants";
import { VariantProps } from "class-variance-authority";
import { ComponentPropsWithoutRef } from "react";

type MultilineInputProps = ComponentPropsWithoutRef<"textarea"> & VariantProps<typeof InputVariants>;

export function TextArea({ placeholder, value, inputSize = "full", ...rest }: MultilineInputProps) {
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
