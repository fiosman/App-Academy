Rails.application.routes.draw do
  namespace :api do, defaults: { format: :json }
    resources :users only: [:create, :new]
    resource :session, only: [:create, :destroy]
  end
  root to: 'static_pages#root'
end
