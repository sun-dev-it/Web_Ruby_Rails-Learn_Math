Rails.application.routes.draw do
  root 'pages#home'
  get '/help', to: 'pages#help'
  get '/congthuc', to: 'pages#CongThuc'
  get '/users', to: 'users#show'
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  resources :feedbacks
  resources :users
end
