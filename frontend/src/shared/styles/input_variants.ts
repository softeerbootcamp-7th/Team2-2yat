import { cva } from "class-variance-authority";

export const InputVariants = cva(
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
