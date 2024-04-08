module.exports = {
  env: {
    es2021: true,
    node: true,
  },
  extends: ["eslint:recommended", "plugin:prettier/recommended"],
  overrides: [
    {
      env: {
        node: true,
      },
      files: [".eslintrc.{js,cjs}"],
    },
  ],
  ignorePatterns: [
    "**/*.test.js",
    "**portal_hello_world/**",
    "**/svc_rules_engine/**",
  ],
  plugins: ["prettier"],
  rules: {
    "prefer-const": [
      "error",
      {
        destructuring: "any",
        ignoreReadBeforeAssign: false,
      },
    ],
    "no-duplicate-imports": [
      "error",
      {
        includeExports: true,
      },
    ],
    "no-trailing-spaces": "error",
  },
};
