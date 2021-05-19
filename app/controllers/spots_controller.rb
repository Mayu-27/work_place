class SpotsController < ApplicationController
  include AcceaCafeScraping
  before_action :search_spot, only: [:index, :serach]

  def index
    @spots = Spot.all
    @random = Spot.order('RAND()').limit(5)
  end

  def new
    set_accea_cafes
  end

  def show
    @spot = Spot.find(params[:id])
    @reviews = Review.all.includes(:user)
  end
  
  def search
    @results = @p.result
  end

  private
  def search_spot
    @p = Spot.ransack(params[:q])
  end
end
