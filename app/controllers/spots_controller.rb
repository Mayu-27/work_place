class SpotsController < ApplicationController
  before_action :search_spot, only: [:index, :search]

  def index
    @spots = Spot.all
    @pickup_spots = Spot.order('RAND()').limit(5)
  end

  def show
    @spot = Spot.find(params[:id])
    @reviews = Review.all.includes(:user)
  end
  
  def search
    @results = @p.result
    @first_result = @results.first
  end

  private
  def search_spot
    @p = Spot.ransack(params[:q])
  end
end
