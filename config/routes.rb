Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  
  get '/dashboard', to: 'users#show'

  resources :users, only: [:new, :create, :update, :edit]


  get '/video' ,to: 'video#show'

end
