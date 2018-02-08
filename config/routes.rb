Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :budgets, only: [:new]
  root to: "home#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  resources :sessions, only: [:destroy]
  scope "/:locale", locale: /en/ do
    resources :users, only: [:new]
    resources :budgets, only: [:new]
  end
end
