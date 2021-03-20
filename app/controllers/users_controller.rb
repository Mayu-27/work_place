class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @favorites = Favorite.all
    @user = User.find(params[:id])
  end


  # def edit

  # end

end
