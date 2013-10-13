SimpleShoppingSite::Application.routes.draw do

  # root 
  root 'home#index'

  get "store/index", as: :store
  resources :order_details, only: [:index, :create, :destroy]
  resources :carts, only: [:show, :destroy]

  resources :products
  resources :categories
  resources :orders do
    member do
      put 'shipped'
    end
  end

  devise_for :users
end
