Rails.application.routes.draw do
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

  #resources :books do
  #  member do
  #   put "add", to: "books#library"
  #    delete :destroy
  #  end
  #end

  resources :users
  resources :users, only: [:new, :create, :show] do
    resources :books, only: [:index]
  end


  resources :books
  
  resources :libraries do
    resources :books
  end
end
