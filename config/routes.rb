Rails.application.routes.draw do
  resources :budgets, only: [:new]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  root to: "home#show"
end
