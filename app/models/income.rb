class Income < ActiveRecord::Base
  has_many :budget_incomes
  has_many :budgets, through: :budget_incomes

  validates :name, presence: true, uniqueness: true
  validates :frequency, presence: true
end
