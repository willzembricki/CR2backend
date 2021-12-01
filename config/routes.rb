Rails.application.routes.draw do
  resources :crimes
  resources :states
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/crimes/data/:state_id/:crime_name', to: 'crimes#line_data'
 
  get "/states/:abbv", to: "states#find_me_state"
  get "/crimes/:state_id/:crime_name", to: "crimes#find_me_crime"

  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  post '/users', to: 'users#create'

  # using route from phase 4 project for line data/ using id/name not id/id
 
 
  resources :users, only: [:new, :create,:edit,:update, :show, :index,:destroy] do
    resources :items, only: [:create, :show, :index, :destroy]
  end  
    
end
