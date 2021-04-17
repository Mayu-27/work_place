class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
  end

  def new
    @spot = Spot.find(params[:spot_id])
    @review = Review.new
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @review = Review.new(review_params)
    if @review.save
      redirect_to spot_path(@spot)
    else
      render :new
    end
  end

  def edit
    @spot = Spot.find(params[:spot_id])
    @review = Review.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:spot_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to spot_path(@spot)
    else
      render :edit
    end
  end

  def destroy
    @spot = Spot.find(params[:spot_id])
    review = Review.find(params[:id])
    review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:overall_evaluation, :comment, :atmosphere, :network_stability, :facility, :congestion, :corona_countermeasure).merge(
      user_id: current_user.id, spot_id: params[:spot_id]
    )
  end
end
