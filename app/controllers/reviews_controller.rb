class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  
  def index
  end

  def new
    @spot = Spot.find(params[:spot_id])
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    # @review = Review.find(id: params[:id])
    @spot = Spot.find(params[:spot_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.user_id == current_user.id
      @review.update(review_params)
    end
  end

  
  
  
  private
  def review_params
    params.require(:review).permit(:overall_evaluation, :comment, :atmosphere, :network_stability, :facility, :congestion, :corona_countermeasure).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end

end
