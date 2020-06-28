Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :chirps, only: [:index]
    end

    resource :session, only: [:create, :destroy]

    post '/search', to: 'users#search'

    resources :chirps
    resources :likes, only: [:create]
    delete '/likes', to: 'likes#destroy'
    resources :follows, only: [:create, :destroy]
  end
  root to: 'root#root'
end
