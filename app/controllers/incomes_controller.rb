class IncomesController < ApplicationController
  before_action :require_login

  def index
    @incomes = current_user.budget.incomes.by_name
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.create(income_params.merge(budget: current_user.budget))

    respond_with(@income)
  end

  def show
  end

  def edit
  end

  def update
    income.update_attributes(income_params)

    respond_with(income)
  end

  def destroy
    income.delete

    respond_with income, location: -> { new_income_path }
  end

  private

  def income_params
    params.require(:income).permit(
      :name,
      :due_date,
      :frequency,
      :amount,
      :budget_id
    )
  end

  def income
    @income ||= Income.find(params[:id])
  end
  helper_method :income
end
