Rails.application.routes.draw do
  root 'welcome#index'
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  get '/video' ,to: 'video#show'
end
