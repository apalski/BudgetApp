class CreateBudgets < ActiveRecord::Migration[5.1]
  def change
    create_table :budgets do |t|
      t.string :name, null: false
      t.references :user
      t.timestamps
    end
  end
end
