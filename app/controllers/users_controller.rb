class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    return if current_user.id == @user.id || current_user.admin?

    redirect_to root_path
  end
end
