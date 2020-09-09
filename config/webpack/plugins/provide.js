// ProvidePlugin => requireをせずにライブラリを参照できる
const webpack = require('webpack')
module.exports = new webpack.ProvidePlugin({
  $: 'jquery',
  jquery: 'jquery'
});