Rails.application.routes.draw do
  resources :users, :artworks, only: [:index, :show, :update, :create, :destroy]
  resources :artwork_shares, only: [:create, :destroy]
end
