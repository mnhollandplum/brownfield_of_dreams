Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  
  resources :users, only: [:new, :create, :update, :edit]

  get '/dashboard', to: 'users#show'

  get '/video' ,to: 'video#show'

end
