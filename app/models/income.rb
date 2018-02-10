class Income < ActiveRecord::Base
  has_many :budget_incomes
  has_many :budgets, through: :budget_incomes
  validates :name, :frequency, presence: true
  validates :name, uniqueness: true
end
