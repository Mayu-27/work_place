class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @favorites = Favorite.where(user_id: current_user.id)
    @user = User.find(params[:id])
  end

  # def edit

  # end

end
