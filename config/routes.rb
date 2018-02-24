Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :budgets
  resources :sessions, only: [:new, :create, :destroy]
  resource :users, only: [:show, :new, :create, :edit, :update]

  root to: "home#show"
end
