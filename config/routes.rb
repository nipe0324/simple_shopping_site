SimpleShoppingSite::Application.routes.draw do

  root 'home#index'
  get "contact" => 'home#contact'

  get "store/index", as: :store
  resources :order_details, only: [:create, :destroy]
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
