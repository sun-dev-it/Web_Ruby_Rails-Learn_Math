Rails.application.routes.draw do
  root 'exercise#index'

  get '/help', to: 'forum#index'
  
  get '/formula', to: 'formula#index'
  get '/hang_dang_thuc', to: 'formula#index'

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
