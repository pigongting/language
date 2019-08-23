const path = require('path');
const fs = require('fs');

const modules = false;

const plugins = [
  require.resolve('babel-plugin-transform-es3-member-expression-literals'),
  require.resolve('babel-plugin-transform-es3-property-literals'),
  require.resolve('babel-plugin-transform-object-assign'),
  require.resolve('babel-plugin-transform-class-properties'),
  require.resolve('babel-plugin-transform-object-rest-spread'),
];

plugins.push([require.resolve('babel-plugin-transform-runtime'), {
  polyfill: false,
}]);

const babelConfig = {
  presets: [
    require.resolve('babel-preset-react'),
    [require.resolve('babel-preset-env'), {
      modules,
      targets: {
        browsers: [
          'last 2 versions',
          'Firefox ESR',
          '> 1%',
          'ie >= 9',
          'iOS >= 8',
          'Android >= 4',
        ],
      },
    }],
  ],
  plugins,
};

// const pkg = require(path.join(process.cwd(), 'package.json'));

// const pluginImportOptions = [
//   {
//     style: true,
//     libraryName: pkg.name,
//     libraryDirectory: 'components',
//   },
// ];

// if (pkg.name !== 'antd') {
//   pluginImportOptions.push({
//     style: 'css',
//     libraryDirectory: 'es',
//     libraryName: 'antd',
//   });
// }

// babelConfig.plugins.push([
//   require.resolve('babel-plugin-import'),
//   pluginImportOptions,
// ]);

// if (modules === false) {
//   babelConfig.plugins.push(replaceLib);
// }

module.exports = babelConfig;

// function replaceLib() {
//   function replacePath(path) {
//     if (path.node.source && /\/lib\//.test(path.node.source.value)) {
//       const esModule = path.node.source.value.replace('/lib/', '/es/');
//       const esPath = path.dirname(path.join(process.cwd(), `node_modules/${esModule}`));
//       if (fs.existsSync(esPath)) {
//         path.node.source.value = esModule;
//       }
//     }
//   }

//   return {
//     visitor: {
//       ImportDeclaration: replacePath,// 导入声明
//       ExportNamedDeclaration: replacePath,// 导出命名声明
//     },
//   };
// }