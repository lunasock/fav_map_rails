class PostsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit]
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to spot_path(@post.spot_id)
    else
      flash.now[:alert] = "口コミは1文字〜100文字でお願いします"
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.spot_id = params[:id]
    if @post.save
      redirect_to spot_path(@post.spot_id)
    else
      @spot = Spot.find(params[:id])
      @post = Post.new
      @posts = @spot.posts.page(params[:page]).reverse_order.per(30)
      flash.now[:alert] = "口コミは1文字〜100文字でお願いします"
      render 'spots/show'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to spot_path(@post.spot_id)
  end

  def correct_user
    post = Post.find(params[:id])
    user = post.user
    if current_user != user
      redirect_to root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(
      :user_id, :spot_id, :review_body, :review_image
    )
  end
end