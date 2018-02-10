Rails.application.routes.draw do
  resources :budgets
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  root to: "home#show"
end
