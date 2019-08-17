class SpotsController < ApplicationController
  
  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
    @spot.save
    redirect_to spot_path(@spot)
  end

  def edit
  end

  def update
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
    @spots.each do |spot|
      @array_spots << spot
    end

    respond_to do |format|
      format.html
      format.json { render json: @array_spots }
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @post = Post.new
    @posts = @spot.posts
  end

  def search
    @spots = Spot.all
    results = Geocoder.search(params[:address])
    # search結果の[0]の緯度経度を代入
    @latlng = results.first.coordinates
    # 検索フォームの値をそのまま代入
    @address = params[:address]
    respond_to do |format|
      format.js
    end
  end

  def livehouse_search
    @livehouses = Livehouse.all
    results = Geocoder.search(params[:address])
    @latlng = results.first.coordinates
    respond_to do |format|
      format.js
    end 
  end

  private
  def spot_params
    params.require(:spot).permit(:user_id, :spot_name, :category, :address, :latitude, :longitude, :spot_image, :spot_body)
  end

end