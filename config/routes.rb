Rails.application.routes.draw do
  resources :reservations
  resources :flights
  resources :users
  resources :planes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
