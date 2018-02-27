class BudgetsController < ApplicationController
  before_action :require_login
  before_action :budget_exists, only: [:new, :create]

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.create(budget_params)
    @budget.user_id = current_user.id
    @budget.save

    respond_with(@budget, location: -> { budgets_path })
  end

  def show
    @budget = current_user.budget
  end

  def edit
    @budget = current_user.budget
  end

  def update
    if current_user.budget.update_attributes(budget_params)
      redirect_to budgets_path, notice: I18n.t(
        "flash.actions.update.notice",
        resource_name: "Budget"
      )
    else
      flash[:alert] = I18n.t(
        "flash.actions.update.alert",
        resource_name: "Budget"
      )
      render :edit
    end
  end

  def destroy
    current_user.budget.delete
    redirect_to new_budgets_path, notice: I18n.t(
      "flash.actions.destroy.notice",
      resource_name: "Budget"
    )
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :budget_type, :user_id)
  end
end
