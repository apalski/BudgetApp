Rails.application.routes.draw do
  resources :budget do
    resources :incomes
    resources :expenses
    resources :goals
  end
  resources :sessions, only: [:new, :create, :destroy]
  resource :users, only: [:show, :new, :create, :edit, :update]

  root to: "home#show"
end
