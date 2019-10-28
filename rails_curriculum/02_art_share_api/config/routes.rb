Rails.application.routes.draw do
  resources :users, only: [:index, :show, :update, :create, :destroy]
  resources :artwork_shares, only: [:create, :destroy]
  resources :artworks, only: [:show, :update, :create, :destroy]
  resources :comments, only: [:create, :destroy, :index]

  resources :users do 
    resources :artworks
  end
end
