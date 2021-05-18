class SpotsController < ApplicationController
  include AcceaCafeScraping

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

  
end
