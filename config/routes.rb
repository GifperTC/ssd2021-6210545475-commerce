Rails.application.routes.draw do
  get 'categories/index'
  root 'welcomes#index'
  resources :welcomes
  devise_for :users
  resources :products
  resources :categories
end
