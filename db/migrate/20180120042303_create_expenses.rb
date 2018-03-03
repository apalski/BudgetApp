class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.string :name, null: false
      t.date :due_date, null: false
      t.integer :frequency, default: 0, null: false
      t.decimal :bill_estimate
      t.decimal :budget_amount
      t.references :budget
      t.timestamps
    end
  end
end
