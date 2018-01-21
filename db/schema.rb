ActiveRecord::Schema.define(version: 20180120061737) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.string "name", null: false
    t.string "budget_type", default: "basic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string "name", null: false
    t.date "due_date"
    t.string "frequency", null: false
    t.decimal "bill_estimate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incomes", force: :cascade do |t|
    t.string "name", null: false
    t.date "due_date"
    t.string "frequency", null: false
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
