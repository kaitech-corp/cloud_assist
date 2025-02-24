module.exports = {
  root: true,
  parser: "@typescript-eslint/parser",
  parserOptions: {
    project: null,
    sourceType: "module",
    ecmaVersion: "latest",
  },
  env: {
    node: true,
    es2022: true,
  },
  extends: [
    "eslint:recommended",
    "plugin:import/errors",
    "plugin:import/warnings",
    "plugin:import/typescript",
    "google",
    "plugin:@typescript-eslint/recommended",
  ],
  ignorePatterns: [
    "/lib/**/*", // Ignore built files.
  ],
  plugins: [
    "@typescript-eslint",
    "import",
  ],
  rules: {
    "quotes": ["error", "double", {"avoidEscape": true}],
    "import/no-unresolved": 0,
    "indent": ["error", 2],
  },
};
