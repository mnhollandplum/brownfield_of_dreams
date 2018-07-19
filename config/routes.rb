Rails.application.routes.draw do
  root 'welcome#index'

  get '/video' ,to: 'video#show'
end
