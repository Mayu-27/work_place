class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user_id: @user.id)
    @favorites = Favorite.where(user_id: @user.id)
  end
end
