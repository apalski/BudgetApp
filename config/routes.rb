Rails.application.routes.draw do
  resources :budget do
    resources :incomes
    resources :expenses
    resources :goals
  end
  namespace :admin do
    resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resource :users, only: [:show, :new, :create, :edit, :update]

  root to: "home#show"
end
