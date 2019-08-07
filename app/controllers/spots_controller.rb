class SpotsController < ApplicationController
  
  def create
    @spot = Spot.new(latitude: params['latitude'], longitude: params['longitude'], spot_name: params['spot_name'])
    @spot.save
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def index
    @array_spots= []
    @spots = Spot.all
    @spots.each do |spot|
      @array_spots << spot
    end

    respond_to do |format|
      format.html
      format.json { render json: @array_spots }
    end
  end

  def show
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

end