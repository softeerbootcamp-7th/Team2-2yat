import js from "@eslint/js";
import noRelativeImportPaths from "eslint-plugin-no-relative-import-paths";
import pluginReact from "eslint-plugin-react";
import simpleImportSort from "eslint-plugin-simple-import-sort";
import globals from "globals";
import tseslint from "typescript-eslint";

export default tseslint.config(
    js.configs.recommended,
    ...tseslint.configs.recommended,
    pluginReact.configs.flat.recommended,
    {
        settings: {
            react: { version: "detect" },
        },
        files: ["**/*.{js,mjs,cjs,ts,mts,cts,jsx,tsx}"],
        plugins: {
            "simple-import-sort": simpleImportSort,
            "no-relative-import-paths": noRelativeImportPaths,
        },
        languageOptions: {
            globals: { ...globals.browser },
        },
        rules: {
            "react/react-in-jsx-scope": "off",
            "simple-import-sort/imports": "error",
            "simple-import-sort/exports": "error",

            "no-relative-import-paths/no-relative-import-paths": [
                "error",
                {
                    allowSameFolder: true, // 같은 폴더(./)는 허용할지 선택
                    rootDir: "src", // baseUrl이 src이므로 src 기준으로 계산
                    prefix: "@", // alias의 시작 접두사
                },
            ],
        },
    },
);
