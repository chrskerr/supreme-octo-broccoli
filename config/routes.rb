Rails.application.routes.draw do
  root :to => 'flights#index'
  resources :reservations
  resources :flights
  resources :users
  resources :planes

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/' => 'session#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
