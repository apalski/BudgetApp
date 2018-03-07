class IncomesController < ApplicationController
  before_action :require_login
  before_action :require_current_budget, only: [:show, :edit, :destroy]

  def index
    @incomes = current_budget.incomes.by_name
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.create(income_params.merge(budget: current_budget))

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

    respond_with income, location: -> { incomes_path }
  end

  private

  def income_params
    params.require(:income).permit(:name, :due_date, :frequency, :amount)
  end

  def income
    @income ||= Income.find(params[:id])
  end
  helper_method :income

  def current_budget
    current_user.budget
  end

  def require_current_budget
    unless current_budget.incomes.include?(incomes.id)
      redirect_to budgets_path, alert: I18n.t(
        "incomes.flashes.alerts.require_current_budget",
      )
    end
  end
end
