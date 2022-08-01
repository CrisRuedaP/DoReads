Rails.application.routes.draw do
  get 'libraries/index'
  get 'libraries/new'
  get 'libraries/create'
  get 'libraries/edit'
  get 'libraries/update'
  # Defines the root path route ("/")
  root "welcome#index"
  
  # Auth
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  # Auth with Google
  #get 'login', to: 'logins#new'
  #get 'login/create', to: 'logins#create', as: :create_login

  resources :users, only: [:new, :create]
  resources :books
  resources :libraries, only:[:index]
end
