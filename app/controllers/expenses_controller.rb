class ExpensesController < ApplicationController
  before_action :require_login
  before_action :current_expense, only: [:update, :destroy]
  before_action :expense, only: [:show]

  def index
    @expenses = current_user.expenses.by_name
  end

  def new
    @expense = current_user.expenses.new
  end

  def create
    @expense = current_user.expenses.create(expense_params)

    respond_with(@expense)
  end

  def show
  end

  def edit
  end

  def update
    current_expense.update_attributes(expense_params)

    respond_with(expense)
  end

  def destroy
    current_expense.delete

    respond_with expense, location: -> { expenses_path }
  end

  private

  def expense_params
    params.require(:expense).
      permit(:bill_estimate, :due_date, :frequency, :name, :user_id)
  end

  def expense
    @expense ||= current_user.expenses.find(params[:id])
  end
  helper_method :expense

  def current_expense
    expense.user == current_user
  end
end
