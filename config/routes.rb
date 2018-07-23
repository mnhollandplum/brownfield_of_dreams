Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get '/dashboard', to: 'users#show'

  get '/browse', to: 'browse#index'
  get '/about', to: 'about#show'
  get '/get_started', to: 'get_started#show'

  resources :users, only: [:new, :create, :update, :edit]


  get '/video' ,to: 'video#show'

end
