class UsersController < ApplicationController
  
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order.per(30)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def check
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :user_body, :icon_image, :backcover_image)
  end

 end
