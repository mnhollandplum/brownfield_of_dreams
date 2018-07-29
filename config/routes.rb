Rails.application.routes.draw do
  root 'welcome#index'
  get 'tags/:tag', to: 'welcome#index', as: :tag

  namespace :admin do
    resources :tutorials, only: [:edit, :update, :destroy]
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get '/dashboard', to: 'users#show'
  get '/about', to: 'about#show'
  get '/get_started', to: 'get_started#show'

  get '/video' ,to: 'video#show'

  resources :users, only: [:new, :create, :update, :edit]
  resources :tutorials, only: [:show, :index]
  resources :user_videos, only:[:create, :destroy]
end
