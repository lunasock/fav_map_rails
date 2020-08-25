class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :accepted)}
  end

  # logged_in?ヘルパーメソッドを定義
  # コントローラーとビューどちらでも使うものはヘルパーメソッドで定義
  helper_method :logged_in?

  # アクションでないものはprivateで定義
  private

  # ログインしていればtrueを返す
  def logged_in?
    # not演算子を2つ重ねることでfalseまたはnilのときfalseを、それ以外はtrueを返す
    !!session[:github_user_id]
  end

end
