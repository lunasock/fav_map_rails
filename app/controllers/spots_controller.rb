class SpotsController < ApplicationController
  
  def new
  end

  def edit
  end

  def index
  end

  def show
  end

  def search
    results = Geocoder.search(params[:address])
    @latlng = results.first.coordinates
    # これでmap.js.erbで、経度緯度情報が入った@latlngを使える。
    respond_to do |format|
      format.js
    end
  end

end
