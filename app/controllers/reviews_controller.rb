class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
  end

  def new
    @review = Review.new
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @review = Review.new(review_params)
    # @post = Post.find(params[:post_id])
    # @comment = @post.comments.new (comment_params)
    binding.pry
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def show

  # end

  private
  def review_params
    params.require(:review).permit(:overall_evaluation, :comment, :atmosphere, :network_stability, :facility, :congestion, :corona_countermeasure).merge(user_id: current_user.id, spot_id: @spot.id)
  end

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
end
