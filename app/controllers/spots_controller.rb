class SpotsController < ApplicationController
  
  # 未ログインでもindex,searchは可能
  before_action :authenticate_user!, only: [:create, :edit, :update, :show, :destroy]
  before_action :correct_user, only: [:edit]
  
  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
    if @spot.save
      redirect_to spot_path(@spot)
    else
      @search = Spot.where(category: 0)
      @spot = Spot.new
      @array_spots= []
      @spots = Spot.all
      @ramens = Spot.where(category: 1)
      @beers = Spot.where(category: 2)
      @coffees = Spot.where(category: 3)
      @parkings = Spot.where(category: 4)
      @places = Spot.where(category: 5)
      @livehouses = Spot.where(category: 0)
      flash.now[:alert] = "場所の名前が未入力、もしくは住所、カテゴリが未選択です"
      render :index
    end
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      redirect_to spot_path(@spot)
    else
      flash.now[:alert] = "場所の名前が未入力です"
      render :edit
    end
  end

  def index
    @search = Spot.where(category: 0)
    @spot = Spot.new
    @array_spots= []
    @spots = Spot.all
    @ramens = Spot.where(category: 1)
    @beers = Spot.where(category: 2)
    @coffees = Spot.where(category: 3)
    @parkings = Spot.where(category: 4)
    @places = Spot.where(category: 5)
    @livehouses = Spot.where(category: 0)
    # # ユーザーとスポットを関連させた場合
    # @user = User.find(params[:id])
    # @spots = @user.spots.includes(:user)
  end

  def show
    @spot = Spot.find(params[:id])
    @post = Post.new
    @posts = @spot.posts.page(params[:page]).reverse_order.per(30)
  end

  def search
    # プルダウンで選択されたライブハウスのidから、該当のSpotをsearch.js.erbに渡す
    @spot = Spot.find(params[:id])
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to root_path
  end

  def correct_user
    spot = Spot.find(params[:id])
    user = spot.user
    if current_user != user
      redirect_to root_path
    end
  end
  
  private
  def spot_params
    params.require(:spot).permit(
      :user_id, :spot_name, :category, :address, :latitude, :longitude, :spot_image, :spot_body
    )
  end

end