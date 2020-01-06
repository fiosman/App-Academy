Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, only: [:create, :new, :show, :index]
resource :session, only: [:create, :destroy, :new]
resources :goals
resources :comments, only: [:create]

root 'users#index'

end
