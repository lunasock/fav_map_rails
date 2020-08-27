class ApplicationController < ActionController::Base
  # アプリケーションコントローラーを継承するコントローラーは、アクションの前にbefore_actionのメソッドが呼ばれる
  before_action :configure_permitted_parameters, if: :devise_controller?
  # 未ログイン時のリダイレクト
  # before_action :authenticate
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :accepted)}
  end

  # logged_in?ヘルパーメソッドを定義
  # コントローラーとビューどちらでも使うものはヘルパーメソッドで定義
  helper_method :logged_in?
  # current_userヘルパーメソッドを定義
  # helper_method :current_user

  # アクションでないものはprivateで定義
  private

  # ログインしていればtrueを返す
  def logged_in?
    # not演算子を2つ重ねることでfalseまたはnilのときfalseを、それ以外はtrueを返す
    !!session[:github_user_id]
  end

  # # current_userヘルパーメソッドでログイン済みかを判断
  # def logged_in?
  #   # not演算子を2つ重ねることでfalseまたはnilのときfalseを、それ以外はtrueを返す
  #   !!current_user
  # end

  # # current_userヘルパーメソッド
  # def current_user
  #   # session[:github_user_id]がfalse(未ログイン)であればリターン
  #   return unless session[:github_user_id]
  #   # ||= => @current_userが未定義なら代入
  #   # コントローラーとビューでユーザー情報を@current_userとして扱う
  #   @current_user ||= GithubUser.find(session[:github_user_id])
  # end

  # def authenticate
  #   # ログイン済みであればリターン
  #   return if logged_in?
  #   redirect_to root_path, alert: "ログインが必要です"
  # end

end
