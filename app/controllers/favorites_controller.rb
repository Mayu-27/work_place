class FavoritesController < ApplicationController
  before_action :set_spot
  before_action :authenticate_user!

  def create
    @favorite = Favorite.new(user_id: current_user.id, spot_id: @spot.id)
    if @favorite.save
      redirect_to user_path(current_user)
    else
      render :show
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, spot_id: @spot.id)
    redirect_to user_path(current_user) if @favorite.destroy
  end

  private

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end
end
