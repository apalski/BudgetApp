class ExpensesController < ApplicationController
  before_action :require_login

  def index
    @expenses = current_budget.expenses.by_name
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expense_params.merge(budget: current_budget))

    respond_with(@expense)
  end

  def show
  end

  def edit
  end

  def update
    expense.update_attributes(expense_params)

    respond_with(expense)
  end

  def destroy
    expense.delete

    respond_with expense, location: -> { expenses_path }
  end

  private

  def expense_params
    params.require(:expense).
      permit(:bill_estimate, :due_date, :frequency, :name)
  end

  def expense
    @expense ||= Expense.find(params[:id])
  end
  helper_method :expense

  def current_budget
    current_user.budget
  end
  helper_method :current_budget
end
