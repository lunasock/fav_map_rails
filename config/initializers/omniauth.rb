Rails.application.config.middleware.use OmniAuth::Builder do
  # 開発環境と本番環境で分ける場合
  if Rails.env.development? || Rails.env.test?
    provider :github,
      Rails.application.credentials.github[:client_id],
      Rails.application.credentials.github[:client_secret]
  else
    provider :github,
      Rails.application.credentials.github[:client_id],
      Rails.application.credentials.github[:client_secret]
  end
end