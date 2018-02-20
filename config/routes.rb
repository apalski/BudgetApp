Rails.application.routes.draw do
  resources :budgets
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users
  end
  # resources :users, only: [:new, :create, :show, :edit, :update]
  root to: "home#show"
end
