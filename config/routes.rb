Rails.application.routes.draw do
  devise_for :users
  root 'welcomes#index'

  resources :products
  resources :categories

end
