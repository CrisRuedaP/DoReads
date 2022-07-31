Rails.application.routes.draw do
  resource :users
  
  get 'login', to: 'logins#new'
  get 'login/create', to: 'logins#create', as: :create_login
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
