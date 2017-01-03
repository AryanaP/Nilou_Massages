Rails.application.routes.draw do
  # attachinary
  mount Attachinary::Engine => "/attachinary"

  #User and login
  devise_for :users


  #pages
  root to: 'pages#home'
  get "/contact", to: 'pages#contact'

  #other
  resources :prices
  resources :events
  resources :partners
  resources :users, only: [ :edit, :update ]

end
