class CreateIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :incomes do |t|
      t.string :name, null: false
      t.date :due_date
      t.integer :frequency, default: 0, null: false
      t.decimal :amount
      t.timestamps
    end
  end
end
