ActiveRecord::Schema.define(version: 20180120061737) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.string "name", null: false
    t.string "budget_type", default: "basic"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "name", null: false
    t.date "due_date"
    t.string "frequency", null: false
    t.decimal "bill_estimate"
  end

  create_table "incomes", force: :cascade do |t|
    t.string "name", null: false
    t.date "due_date"
    t.string "frequency", null: false
    t.decimal "amount"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
