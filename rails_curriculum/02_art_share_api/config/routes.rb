Rails.application.routes.draw do
  # get 'users/:id', to: 'users#show', as: 'user'
  # get 'users/', to: 'users#index', as: 'users'
  # get 'users/new', to: 'users#new', as:  'new_user'  
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # post 'users/', to: 'users#create', as: 'create_user' 
  # patch 'users/:id', to: 'users#update', as: 'update_user'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy', as: 'delete_user'
  resources :users, only: [:index, :show, :update, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
