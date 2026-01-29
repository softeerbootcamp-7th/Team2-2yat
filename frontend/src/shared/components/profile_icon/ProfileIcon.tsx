import { COLOR_SET } from "@shared/styles/color_set";
import { cn } from "@utils/cn";
import { cva, type VariantProps } from "class-variance-authority";

type Props = VariantProps<typeof profileIconVariants> & {
    name: string;
    isOnline?: boolean;
    className?: string;
};

const ProfileIcon = ({ size = "md", name, isOnline, className }: Props) => {
    const initialName = name.trim().charAt(0);

    return (
        <div className={cn(profileIconVariants({ size }), className)}>
            {initialName}

            {isOnline && <span className={cn(indicatorVariants({ size }))} />}
        </div>
    );
};

export default ProfileIcon;

const profileIconVariants = cva(
    `relative flex items-center justify-center rounded-full shrink-0 ${COLOR_SET.tertiary}`,
    {
        variants: {
            size: {
                md: "w-10 h-10 typo-body-18-semibold",
                sm: "w-6 h-6 typo-body-10-semibold",
            },
        },
    },
);

const indicatorVariants = cva("absolute bottom-0 right-0 rounded-full bg-green-300", {
    variants: {
        size: {
            md: "w-3 h-3",
            sm: "w-1.75 h-1.75",
        },
    },
});
