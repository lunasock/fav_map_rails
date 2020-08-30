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

  # Exceptionは全ての例外の祖先となるクラス
  # rescue_fromは後のものから判定するのでExceptionは1番上に記述
  rescue_from Exception, with: :error500
  # RecordNotFound、RoutingErrorの場合
  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404

  def error404(e)
    # error404のビューに飛ばす
    render "error404", status: 404, formats: [:html]
  end

  def error500(e)
    # ログにエラーの種類とバックトレースを出力
    logger.error [e, *e.backtrace].join("\n")
    # error500のビューに飛ばす
    render "error500", status: 500, formats: [:html]
  end

end
