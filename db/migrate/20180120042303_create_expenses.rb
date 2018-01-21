class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.string :name, null: false
      t.date :due_date
      t.string :frequency, null: false
      t.decimal :bill_estimate
      t.timestamps
    end
  end
end
