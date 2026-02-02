import { cn } from "@/utils/cn";

type Direction = "x" | "y";
type Props = React.ComponentPropsWithoutRef<"div"> & {
    direction?: Direction;
};

const Divider = ({ direction = "x", className, ...props }: Props) => {
    return <div className={cn(`bg-gray-300 ${directionStyles(direction)}`, className)} {...props} />;
};

export default Divider;

const directionStyles = (direction: Direction) => (direction === "x" ? "w-full h-px" : "h-full w-px");
