class SpotsController < ApplicationController
  

  include AcceaCafeScraping 

  def index
    @spots = Spot.all
    @recommended_spots = Spot.find(Review.group(:overall_evaluation).order('avg(overall_evaluation) desc').limit(5).pluck(:spot_id))
    # @random = Spot.order("RAND()").limit(5)
    # @recommended_spots = Review.group(:spot_id).average(:overall_evaluation)
  end

  def new
    set_accea_cafes 
  end

  def show
    @spot = Spot.find(params[:id])
    @reviews = Review.all.includes(:user)
  end

  

end


