Rails.application.routes.draw do

  scope "/:locale", locale: /en/ do
    resources :users, only: [:new]
    resources :budgets, only: [:new]
  end
end
