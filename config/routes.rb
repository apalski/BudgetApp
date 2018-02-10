Rails.application.routes.draw do
  resources :users
  resources :budgets, only: [:new]
  resources :sessions, only: [:new, :create, :destroy]
  root to: "home#show"
end
