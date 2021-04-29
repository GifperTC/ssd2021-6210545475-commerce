Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'welcomes#index'
  resources :welcomes

  scope '/admin' do
    resources :products, :categories, :users, :orders
    namespace :products do
      post 'csv_upload'
    end
    delete 'products/d_cover_image/:id', to: 'products#d_cover_image'
    delete 'products/d_desc_images/:id', to: 'products#d_desc_images'
    get 'orders/d_order/:id', to: 'orders#destroy'
  end
end
