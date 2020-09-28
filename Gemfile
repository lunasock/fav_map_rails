source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4.2'
# Use Puma as the app server
gem 'puma', '~> 5.0.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] 
  # .rubocop.ymlはルートフォルダに置く
  # .git/hooks/pre-commitに以下記載でコミット前にrubocopを走らせる
  # #!/bin/sh
  # bundle exec rubocop
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # 脆弱性を解析
  # bundle exec brakeman -IA
  # -Aで全ての項目を検索、-wlで軽微な問題まで検索
  # iで無視リストに追加
  # sでスキップ
  # uで無視リストから除外
  gem 'brakeman'

  # ローカルで使えるパフォーマンス測定
  # 導入時にrails g rack_profiler:install
  # 本番環境に近いDBにしておく
  # WebサービスとしてSkylight(https://www.skylight.io/)もある
  gem 'rack-mini-profiler', require: false

  # N+1問題を察知
  # config/environments/development.rb に設定を記載
  # bundle exec rails g bullet:install
  gem 'bullet'

end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  # gem 'chromedriver-helper'
  gem 'webdrivers', '~> 4.4'
  gem 'rspec-rails'
  gem "factory_bot_rails"
  gem 'rspec-parameterized'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise'

gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick"

gem 'bootstrap-sass', '~> 3.4.1'
gem 'jquery-rails'

gem 'pry-byebug', group: :development

# deviseの日本語化
gem 'devise-i18n'
gem 'devise-i18n-views'

# 論理削除
gem 'paranoia'

# ページネイション
# rails g kaminari:views bootstrap4でkaminariのテンプレートを作成
gem 'kaminari','~> 1.2.1'

# omniauth
gem 'omniauth','~> 1.9.1'
# githubログイン
gem 'omniauth-github','~> 1.4.0'
# csrf対策
gem 'omniauth-rails_csrf_protection','~> 0.1.2'

# Railsの辞書データを日本語化
# モデルやカラムの名前などの辞書データは手動でconfig/locales/ja.ymlに記載
gem 'rails-i18n'

# カバレッジ測定
# spec_helper.rbにrequire 'simplecov'を追記
# 並列テストの設定はオフにする必要がある
# WebサービスとしてCoveralls(https://coveralls.io)もある
gem 'simplecov', require: false, group: :test

# エラートラッキング
# rails g rollbar
# 環境変数にトークンを設定
# raise RuntimeErrorなどで擬似的にエラーを起こせる
gem 'rollbar'

# rails6.0からjsのコンパイラーはwebpackerに
# bundle install => rails webpacker:install
gem 'webpacker'

gem 'mysql2', '>= 0.4.4'

# elasticsearchで利用
# モデルに設定を追加する
# bin/rails r モデル名.reindex
gem 'searchkick', '~> 4.3.0'