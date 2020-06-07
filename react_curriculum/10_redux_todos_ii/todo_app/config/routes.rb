Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  
  namespace :api, defaults: { format: :json } do 
    resources :todos, except: [:edit, :new] do 
      resources :steps, except: [:edit, :new] 
    end

    resources :steps, only: [:update, :destroy]
  end
  root to: 'static_pages#root'
end
