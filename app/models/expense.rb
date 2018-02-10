class Expense < ActiveRecord::Base
  has_many :budget_expenses
  has_many :budgets, through: :budget_expenses
  validates :name, :frequency, presence: true
  validates :name, uniqueness: true
end
