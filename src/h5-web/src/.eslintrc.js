module.exports = {
  env: {
    browser: true,
    es6: true,
    node: true,
  },
  extends: "react-app",
  parser: 'babel-eslint',
  parserOptions: {
    ecmaFeatures: {
      arrowFunctions: true,
      experimentalObjectRestSpread: true,
      jsx: true,
    },
    sourceType: 'module',
  },
  rules: {
    "no-unused-vars": [0],
    "no-undef": [0],
    "jsx-a11y/href-no-hash": [0],
  },
};