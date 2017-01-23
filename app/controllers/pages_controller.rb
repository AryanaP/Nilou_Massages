class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :contact ]

  def home
    @prices = policy_scope(Price).order(name: :desc)
    user = User.where(email: "niloufer@ravari.fr")
    @events = Event.where(home: true)
    @admin = user[0]
  end

  def contact
    user = User.where(email: "niloufer@ravari.fr")
    @admin = user[0]
  end

end
