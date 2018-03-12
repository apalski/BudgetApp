class BudgetsController < ApplicationController
  before_action :require_login
  before_action :budget_exists, only: [:new, :create]
  before_action :require_budget, only: [:show, :edit, :update, :destroy]

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.create(budget_params.merge(user: current_user))

    respond_with(@budget, location: -> { budgets_path })
  end

  def show
    @expenses = current_user.budget.expenses
  end

  def edit
  end

  def update
    current_user.budget.update_attributes(budget_params)

    respond_with current_user.budget, location: -> { budgets_path }
  end

  def destroy
    current_user.budget.delete
    redirect_to new_budgets_path, notice: I18n.t(
      "flash.actions.destroy.notice",
      resource_name: "Budget",
    )
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :frequency, :user_id)
  end

  def budget
    @budget ||= current_user.budget
  end
  helper_method :budget

  def budget_exists
    if current_user.budget
      redirect_to budgets_path, alert: I18n.t(
        "budgets.new.budget_exists",
      )
    end
  end

  def require_budget
    unless current_user.budget
      redirect_to new_budgets_path, alert: I18n.t(
        "budgets.defaults.require_budget",
      )
    end
  end
end
