class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @favorites = Favorite.where(user_id: current_user.id)
    # @favorites = Favorite.where(user_id: current_user.id).pluck(:spot_id)
  end


  # def edit

  # end

end
