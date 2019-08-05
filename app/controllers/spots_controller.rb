class SpotsController < ApplicationController
  
  def new
  end

  def create
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