class Budget < ActiveRecord::Base
  belongs_to :user
  has_many :budget_incomes
  has_many :incomes, through: :budget_incomes
  has_many :budget_expenses
  has_many :expenses, through: :budget_expenses
  validates :name, presence: true, uniqueness: true
end
