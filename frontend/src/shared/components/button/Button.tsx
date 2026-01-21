import { ComponentPropsWithoutRef } from "react";
import { cva, type VariantProps } from "class-variance-authority";

type Props = ComponentPropsWithoutRef<"button"> & VariantProps<typeof buttonVariants>;

const Button = ({ children, variant, size, className, ...rest }: Props) => {
    return (
        <button className={buttonVariants({ variant, size, className })} {...rest}>
            {children}
        </button>
    );
};

export default Button;

const buttonVariants = cva("rounded-2xl", {
    variants: {
        variant: {
            primary: "bg-primary text-white",

            secondary: "bg-cobalt-200 text-white",

            "tertiary-outlined": "bg-white outline-primary text-primary outline-1",
            "tertiary-filled-outlined-2": "text-primary bg-primary-bg-02 outline-white outline-1",
            "tertiary-filled": "bg-cobalt-200 text-primary",
            "tertiary-filled-outlined": "bg-primary-bg-02 outline-primary text-primary outline-1",

            quaternary: "bg-gray-100 text-gray-800",
            "quaternary-outlined": "bg-white outline-gray-300 text-gray-800 outline-1",

            notification: "bg-green-100 text-green-200",
            alert: "bg-red-100 text-red-200",
        },
        size: {
            sm: "py-3 px-4 min-w-20",
            md: "w-full py-4 px-5",
            lg: "w-full py-5 px-10",
        },
    },
    defaultVariants: {
        variant: "primary",
        size: "md",
    },
});
