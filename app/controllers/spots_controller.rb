class SpotsController < ApplicationController
  

  include AcceaCafeScraping 

  def index
    @spots = Spot.all
  end

  def new
    set_accea_cafes 
  end

  def show
    @spot = Spot.find(params[:id])
    @reviews = Review.all
  end

end


