Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :show, :create]
  resources :sessions, only: [:new, :create]
  resources :attractions
  resources :rides, only: [:create]

  root :to => "welcome#home"

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/logout", to: "sessions#destroy"


end
