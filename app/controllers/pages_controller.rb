class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :contact ]

  def home
  end

  #voir : afficher tarifs, evenements

end
