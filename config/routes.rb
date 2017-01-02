Rails.application.routes.draw do

  #User and login
  devise_for :users

  #pages
  root to: 'pages#home'
  get "/contact", to: 'pages#contact'

  #other
  resources :prices

end
