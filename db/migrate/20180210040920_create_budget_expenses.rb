class CreateBudgetExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :budget_expenses do |t|
      t.references :budget
      t.references :expense
    end
  end
end
