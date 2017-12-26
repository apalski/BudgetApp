Rails.application.routes.draw do

  root "application#welcome"
  get "/application/oauthError", to: "application#oauthError"
  resources :sessions, only: [:new, :create, :destroy]
  delete '/sessions/destroy', to: 'sessions#destroy'
  resources :users
  get "/auth/facebook/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/application/oauthError")
end
