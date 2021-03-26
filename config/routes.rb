Rails.application.routes.draw do
  root 'welcomes#index'
  resources :welcomes
  devise_for :users
  resources :products
  # resources :categories
end
