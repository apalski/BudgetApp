class CreateBudgetIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :budget_incomes do |t|
      t.references :budget
      t.references :income
    end
  end
end
