Rails.application.routes.draw do
  namespace :api, defaults: { format: :json  } do
    resource :user, only: [:create]
    resource :session, only: [:create, :destroy]
  end
  root to: 'static_pages#root'
end
