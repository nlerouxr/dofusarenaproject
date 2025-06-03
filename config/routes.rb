Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#new"
  get "games/lobby", to: "games#lobby", as: "lobby"
  resources :games, only: [:create, :show]

  post "games/:id/join", to: "games#join", as: "join_game"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [:show, :index, :create]

  post "/signup", to: "users#create", as: :signup
  get "/signup", to: "users#new", as: :new_user
  get "/login", to: "sessions#new", as: :new_login

  post "/login", to: "sessions#create", as: :login

  delete "/logout", to: "sessions#destroy", as: :logout

  get "/me", to: "users#show_me", as: :me
end
