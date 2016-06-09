class UsersController < ApplicationController
before_action :set_user, only: [ :update]

  def update
      if @user.update(user_params)
        redirect_to user_path(@product)
      else
        render :edit
      end
  end

private
   ​
  def user_params
    params.require(:user).permit(:name, :address, :city, :country, :price, :picture, :picture_cache)
  end

  def set_user
      @user = User.find(params[:id])
  end
end
