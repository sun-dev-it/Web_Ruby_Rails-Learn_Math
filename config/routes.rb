Rails.application.routes.draw do
  root 'home#index'

  get '/help', to: 'forum#index'
  get '/flashcard', to: 'flashcard#index'

  get '/users', to: 'users#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :snapshots, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
