class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
    authorize @user
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
    authorize @user
  end

  private

  def set_user
     @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :description, :admin, :email, :password, :photo)
  end

end

