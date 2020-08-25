class GithubUsersController < ApplicationController
  # ログイン
  def create
    # GithubUserモデルでfind_or_create_from_auth_hash!メソッドを定義
    # request.env["omniauth.auth"]にはアクセストークンなどが格納されている
    user = GithubUser.find_or_create_from_auth_hash!(request.env["omniauth.auth"])
    # find_or_create_from_auth_hash!メソッドが返すIDをセッションに格納
    session[:github_user_id] = user.id
    redirect_to root_path, notice: "ログインしました"
  end

  # ログアウト
  def destroy
    # セッションの値を削除
    reset_session
    # ログアウト後はrootに遷移
    redirect_to root_path, notice: "ログアウトしました"
  end
end
