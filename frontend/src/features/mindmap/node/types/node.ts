import { nodeVariants } from "@/features/mindmap/node/components/node/Node";
import { DefinedVariantProps } from "@/shared/types/safe_variant_props";

export type NodeMode = "default" | "highlight" | "selected";

export type Size = DefinedVariantProps<typeof nodeVariants>["size"];
