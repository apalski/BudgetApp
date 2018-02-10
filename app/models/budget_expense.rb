class BudgetExpense < ActiveRecord::Base
  belongs_to :budget
  belongs_to :expense
end
