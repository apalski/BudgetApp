Rails.application.routes.draw do

  get "/", to: "root"
  get "/auth/facebook/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
end
