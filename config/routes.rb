Rails.application.routes.draw do
  resource :budgets, only: [:show, :new, :create, :edit, :update, :destroy]
  namespace :admin do
    resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :goals
  resources :sessions, only: [:new, :create, :destroy]
  resource :users, only: [:show, :new, :create, :edit, :update]

  root to: "home#show"
end
