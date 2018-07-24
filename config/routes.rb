Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get '/dashboard', to: 'users#show'
  get '/about', to: 'about#show'
  get '/get_started', to: 'get_started#show'

  resources :users, only: [:new, :create, :update, :edit]
  resources :tutorials, only: [:show, :index]
  resources :videos, only: [:show, :index]
  resources :user_videos, only:[:create, :destroy]

end
