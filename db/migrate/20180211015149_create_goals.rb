class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :name, null: false
      t.date :due_date, null: false
      t.decimal :amount, null: false
      t.references :user, index: true
      t.timestamps
    end
  end
end
