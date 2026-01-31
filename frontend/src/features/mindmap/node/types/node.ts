import { DefinedVariantProps } from "@/shared/types/safe_variant_props";
import { nodeVariants } from "@/features/mindmap/node/components/node/Node";

export type NodeMode = "default" | "highlight" | "selected";

export type Size = DefinedVariantProps<typeof nodeVariants>['size'];

