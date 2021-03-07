class SpotsController < ApplicationController
  # ピン留めのテストように１件のみ取得

  include AcceaCafeScraping 

  def index
    @spot = Spot.find(2)
  end

  def new
    binding.pry
    set_accea_cafes # ここまでは動いてる
    # save(data)  # ここでエラー data
  end

end


