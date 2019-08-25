class SpotsController < ApplicationController
  
  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
    @spot.save
    redirect_to spot_path(@spot)
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.update(spot_params)
    redirect_to spot_path(@spot)
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
  end

  def show
    @spot = Spot.find(params[:id])
    @post = Post.new
    @posts = @spot.posts
  end

  def search
    @spot = Spot.find(params[:id])
    @livehouses = Spot.where(category: 0)
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to root_path
  end
  
  private
  def spot_params
    params.require(:spot).permit(:user_id, :spot_name, :category, :address, :latitude, :longitude, :spot_image, :spot_body)
  end

end