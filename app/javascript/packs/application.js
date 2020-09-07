/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// cssをWebpackerで管理する
// app/javascript/stylesheets/application.css を作成
require("stylesheets/application")
// 画像をWebpackerで管理する
// app/javascript/media/images を作成
require.context("../media/images", true)

// コンパイルは rails webpacker:compile
// js用のサーバーを動かしておく bin/webpack-dev-server

console.log('Hello World from Webpacker')
