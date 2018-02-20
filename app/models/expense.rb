class Expense < ActiveRecord::Base
  has_many :budget_expenses
  has_many :budgets, through: :budget_expenses

  validates :name, presence: true, uniqueness: true
  validates :frequency, presence: true
end
