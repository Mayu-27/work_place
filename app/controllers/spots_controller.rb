class SpotsController < ApplicationController
  # ピン留めのテストように１件のみ取得

  include AcceaCafeScraping 

  def index
    @spots = Spot.all
  end

  def new
    set_accea_cafes 
  end

end


