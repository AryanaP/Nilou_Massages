class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :contact ]

  def home
    @prices = policy_scope(Price).order(name: :desc)
    @admin  = User.find_by(email: "niloufer@ravari.fr")
    @events = Event.where(home: true)
  end

  def contact
    @admin = User.find_by(email: "niloufer@ravari.fr")
  end

end
