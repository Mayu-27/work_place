class UsersController < ApplicationController
  def show
    @reviews = Review.all
    @nickname = current_user.nickname
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id)
  end
end
