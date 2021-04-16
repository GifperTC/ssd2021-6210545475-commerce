Rails.application.routes.draw do
  devise_for :users
  root 'welcomes#index'
  
  scope '/admin' do
    resources :products
    namespace :products do
      post 'csv_upload'
    end
    resources :categories
    delete 'items/d_cover_image/:id', to: 'products#d_cover_image'
    delete 'items/d_desc_images/:id', to: 'products#d_desc_images'
  end
end
