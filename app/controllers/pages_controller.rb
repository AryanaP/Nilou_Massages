class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :contact ]

  def home
    @prices = policy_scope(Price).order(name: :desc)
    user = User.where(email: "niloufer@ravari.fr")
    @admin = user[0]
  end

  def contact
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :admin, :email, :password)
  end

end
