class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expense_params)

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

    respond_with expense, location: -> { new_expense_path }
  end

  private

  def expense_params
    params.require(:expense).
      permit(:name, :due_date, :frequency, :bill_estimate)
  end

  def expense
    @expense ||= Expense.find(params[:id])
  end
  helper_method :expense
end
