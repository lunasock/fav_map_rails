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
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "ユーザーネームは8文字、自己紹介は44文字までです"
      render :edit
    end
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
    params.require(:user).permit(:user_name, :user_body, :icon_image, :backcover_image, :accepted)
  end

 end
