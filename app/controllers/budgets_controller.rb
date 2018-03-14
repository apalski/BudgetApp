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
    @expenses = current_budget.expenses
    @expenses_total = total_expenses
  end

  def edit
  end

  def update
    current_budget.update_attributes(budget_params)

    respond_with current_budget, location: -> { budgets_path }
  end

  def destroy
    current_budget.delete
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

  def current_budget
    current_user.budget
  end

  def total_expenses
    current_budget.expenses.map(&:bill_estimate).sum
  end
end
