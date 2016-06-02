Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show]
  resources :listings
  root 'listings#index'
end
