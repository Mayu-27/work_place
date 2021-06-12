class UsersController < ApplicationController
  def show
    @reviews = Review.all
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id)
  end
end
