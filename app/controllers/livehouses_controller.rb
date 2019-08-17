class LivehousesController < ApplicationController
  
  def new
    @livehouse = Livehouse.new
    @ramens = Spot.where(category: 0)
    @beers = Spot.where(category: 1)
    @coffees = Spot.where(category: 2)
    @parkings = Spot.where(category: 3)
    @places = Spot.where(category: 4)
    @livehouses = Livehouse.all
  end

  def create
    @livehouse = Livehouse.new(livehous_params)
    @livehouse.save
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
  end

  def destoroy
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

  private
  def livehouse_params
    params.require(:livehouse).permit(:livehouse_name, :address, :latitude, :longitude, :category, :livehouse_image, :livehouse_body)
  end

end
