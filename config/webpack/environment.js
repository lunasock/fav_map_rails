const { environment } = require('@rails/webpacker')
// rails webpacker:install:erb
const erb = require('./loaders/erb')
// config/webpack/plugins/provide.jsを作成
const provide = require('./plugins/provide')

// rails webpacker:install:erb
environment.loaders.prepend('erb', erb)
// config/webpack/plugins/provide.jsを作成
environment.plugins.prepend('provide', provide)
module.exports = environment