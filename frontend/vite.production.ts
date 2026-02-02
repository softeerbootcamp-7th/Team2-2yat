import { defineConfig, mergeConfig } from "vite";

import baseConfig from "./vite.base";

export default defineConfig(() => {
    return mergeConfig(baseConfig, {
        mode: "production",
        build: {
            minify: "esbuild",
        },
    });
});
