class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :contact ]

  def home
    @prices = policy_scope(Price).order(name: :desc)
    user = User.where(email: "niloufer@ravari.fr")
    @admin = user[0]
    @events = Event.where(home: true)
  end

  def contact
  end

end
