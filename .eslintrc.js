module.exports = {
  env: {
    browser: true,
    node: true,
    es2021: true,
  },
  extends: [
    "eslint:recommended",
    // "prettier", // deaktiviert Regeln, die mit Prettier kollidieren
  ],
  parserOptions: {
    ecmaVersion: "latest",
    sourceType: "module",
  },
  rules: {
    eqeqeq: ["error", "always"],
    curly: ["error", "all"],
    "no-debugger": "error",
    "no-unused-vars": ["warn", { argsIgnorePattern: "^_" }],
  },
};

