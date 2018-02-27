Rails.application.routes.draw do
  resource :budgets, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  root to: "home#show"
end
