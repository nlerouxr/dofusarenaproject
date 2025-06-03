Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"

  resources :users, only: [:show, :index, :new, :create]

  post "/signup", to: "users#create", as: :signup
  get "/signup", to: "users#new", as: :new_user
  get "/login", to: "sessions#new", as: :new_login

  post "/login", to: "sessions#create", as: :login
  
  delete "/logout", to: "sessions#destroy", as: :logout

  get "/me", to: "users#show_me", as: :me
end
