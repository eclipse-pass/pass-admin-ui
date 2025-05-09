'use strict';

const EmberApp = require('ember-cli/lib/broccoli/ember-app');

const Funnel = require('broccoli-funnel');
const { WatchedDir } = require('broccoli-source');
const { MergeTrees } = require('broccoli-merge-trees');

const isProduction = EmberApp.env() === 'production';

module.exports = function (defaults) {
  const app = new EmberApp(defaults, {
    'ember-cli-babel': { enableTypeScriptTransform: true },

    // Add options here
    trees: { app: getAppTree() },
  });

  const { Webpack } = require('@embroider/webpack');
  return require('@embroider/compat').compatBuild(app, Webpack, {
    staticAddonTestSupportTrees: true,
    staticAddonTrees: true,
    staticHelpers: true,
    staticModifiers: true,
    staticComponents: true,
    staticEmberSource: true,
    skipBabel: [
      {
        package: 'qunit',
      },
    ],
    packagerOptions: {
      webpackConfig: {
        module: {
          rules: [
            {
              test: /\.css$/i,
              use: [
                {
                  loader: 'postcss-loader',
                  options: {
                    postcssOptions: {
                      config: 'postcss.config.js',
                    },
                  },
                },
              ],
            },
          ],
        },
      },
    },
  });
};

function getAppTree() {
  let appTree = new WatchedDir('app');

  if (!isProduction) {
    appTree = new MergeTrees([
      appTree,
      new Funnel(new WatchedDir('mirage'), { destDir: 'mirage' }),
    ]);
  }

  return appTree;
}
