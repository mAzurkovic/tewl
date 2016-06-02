Rails.application.routes.draw do
  resources :users

  devise_for :users
  resources :listings
  root 'listings#index'
end
