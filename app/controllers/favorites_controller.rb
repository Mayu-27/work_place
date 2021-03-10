class FavoritesController < ApplicationController
  before_action :set_spot
  before_action :authenticate_user!

  def create
    # if @spot.user_id != current_user.id   # 投稿者本人以外に限定　
    @favorite = Favorite.new(user_id: current_user.id, spot_id: @spot.id)
    # end
    if @favorite.save 
      redirect_to user_path(current_user)
    else
      render :show
    end
  end

 
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, spot_id: @spot.id)
    @favorite.destroy
  end

  private
  def set_spot
    @spot = Spot.find(params[:spot_id])
  end

end



