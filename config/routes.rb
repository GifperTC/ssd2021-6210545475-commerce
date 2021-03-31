Rails.application.routes.draw do
  devise_for :users
  root 'welcomes#index'

  resources :products
  namespace :products do
    post 'csv_upload'
  end
  resources :categories

end
