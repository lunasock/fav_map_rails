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
  end

  def show
  end

  def search
    results = Geocoder.search(params[:address])
    # search結果の[0]の緯度経度を代入
    @latlng = results.first.coordinates
    @address = params[:address]
    respond_to do |format|
      format.js
    end
  end

end