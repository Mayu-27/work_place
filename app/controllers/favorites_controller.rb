class FavoritesController < ApplicationController
  before_action :authenticate_user!

  # def create
  #   favorite = Favorite.new
  #   favorite.user_id = current_user.id
  #   favorite.spot_id = params[:spot_id]

  #   if favorite.save
  #     redirect_to root_path
  #   else
  #     pass
  #   end
  # end

end
