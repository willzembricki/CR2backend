Rails.application.routes.draw do
  resources :arrests
  resources :crimes
  resources :states
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get 'logged_in', to: 'sessions#is_logged_in?'
  post '/users', to: 'users#create'
  resources :users, only: [:new, :create,:edit,:update, :show, :index,:destroy] do
    resources :items, only: [:create, :show, :index, :destroy]
  end  
    
end
