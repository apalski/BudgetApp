class Expense < ActiveRecord::Base
  belongs_to :budget, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :frequency, presence: true

  periods = {
    Weekly: 1.0,
    Fortnightly: 2.0,
    Monthly: 4.334,
    Quarterly: 13.0,
    Annual: 52.0,
  }

  def adjust_to_budget(expense.frequency)
    budget_freq = current_user.budget.frequency
    if periods[budget_freq] >= periods[expense.frequency]
      budget_amount = periods[budget_freq]/periods[expense.frequency] * bill_estimate
    else
      expense_a_year = 52/periods[expense.frequency]
      budget_a_year = 52/periods[budget_freq]
      budget_amount = (expense_a_year * bill_estimate)/budget_a_year
  end
end

budget_amount needs to round to 2 places

In controller:
  def create
    budget_amount = adjust_to_budget(params[:frequency])
    expense = Expense.create(expense_params.merge(
      budget: current_user.budget,
      budget_amount: budget_amount
    ))
  end
