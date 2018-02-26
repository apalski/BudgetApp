class Budget < ActiveRecord::Base
  belongs_to :user
  has_many :budget_incomes
  has_many :budget_expenses

  validates :name, presence: true, uniqueness: true
end
