Rails.application.routes.draw do

  root "application#welcome"

  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  get "/auth/facebook/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/application/oauthError")
  get "/application/oauthError", to: "application#oauthError"
end
