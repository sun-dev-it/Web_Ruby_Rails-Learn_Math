Rails.application.routes.draw do
  root 'home#index'

  get '/help', to: 'forum#index', name: "forum"
  get '/flashcards', to: 'flashcards#index', name: "flashcards"

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

  get '/flashcards/new', to: 'flashcards#new'
  resources :snapshots do
    resources :comments, only: [:create, :update, :destroy, :edit]
  end
  resources :snapshots, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :flashcards, only: [:index, :show, :new, :create, :destroy, :edit, :update]
end

