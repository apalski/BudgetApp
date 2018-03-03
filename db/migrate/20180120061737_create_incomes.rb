class CreateIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :incomes do |t|
      t.string :name, null: false
      t.date :due_date
      t.string :frequency, null: false
      t.decimal :amount
      t.decimal :budget_amount
      t.references :budget
      t.timestamps
    end
  end
end
