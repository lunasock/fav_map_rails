require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BandBund
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # DBはUTC、Rails内ではJST
    config.time_zone = "Tokyo"
    # DBもJSTにする場合
    # かつアプリケーションサーバのタイムゾーンをJSTにする
    # config.active_record.default_time_zone = :local
    # viewの記載
    # <!-- 現在時刻を変数で持つ -->
    # <!-- Time.nowは現在時刻、Time.zone.nowは「config/application.rb」で設定したタイムゾーンを参照する -->
    # <% now = Time.zone.now %

    # form_withのAjaxの挙動をオフにする
    # config.action_view.form_with_generates_remote_forms = false

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
