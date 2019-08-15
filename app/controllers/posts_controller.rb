class PostsController < ApplicationController
  def index
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.spot_id = params[:id]
    @post.save!
    redirect_to spot_path(@post.spot_id)
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :spot_id, :review_body, :review_image)
  end
end