class BudgetsController < ApplicationController
  before_action :require_login

  def index
    @budgets = current_user.budgets
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = current_user.budgets.create(budget_params)

    respond_with(@budget)
  end

  def show
  end

  def edit
  end

  def update
    budget.update_attributes(budget_params)

    respond_with(budget)
  end

  def destroy
    budget.delete

    respond_with budget, location: -> { new_budget_path }
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :budget_type, :user_id)
  end

  def budget
    @budget ||= Budget.find(params[:id])
  end
  helper_method :budget
end
