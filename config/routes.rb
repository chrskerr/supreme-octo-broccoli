Rails.application.routes.draw do
  root :to => 'flights#index'
  resources :reservations
  resources :flights
  resources :users, only: [:index, :show, :new, :create]
  resources :planes
  
  get '/cities' => 'flights#cities'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/' => 'session#destroy'
  get '/:origin/destinations' => 'flights#destinations'
  get '/:origin/:destination' => 'flights#search'
  get '/:origin' => 'flights#search'
end
