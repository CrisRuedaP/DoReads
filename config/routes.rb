Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "welcome#index"
  
  # Auth
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  resource :users, only: [:new, :create]

  # Auth with Google
  get 'login', to: 'logins#new'
  get 'login/create', to: 'logins#create', as: :create_login
end
