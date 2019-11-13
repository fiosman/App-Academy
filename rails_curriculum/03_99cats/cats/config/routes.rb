Rails.application.routes.draw do
  resources :cats
  resources :cat_rental_requests, only: [:create, :new] do 
    member do 
      put :approve
      put :deny
    end
  end
end
