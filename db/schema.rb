ActiveRecord::Schema.define(version: 20180210040920) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budget_expenses", force: :cascade do |t|
    t.bigint "budget_id"
    t.bigint "expense_id"
    t.index ["budget_id"], name: "index_budget_expenses_on_budget_id"
    t.index ["expense_id"], name: "index_budget_expenses_on_expense_id"
  end

  create_table "budget_incomes", force: :cascade do |t|
    t.bigint "budget_id"
    t.bigint "income_id"
    t.index ["budget_id"], name: "index_budget_incomes_on_budget_id"
    t.index ["income_id"], name: "index_budget_incomes_on_income_id"
  end

  create_table "budgets", force: :cascade do |t|
    t.string "name", null: false
    t.string "budget_type", default: "basic"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_budgets_on_user_id"
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

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end
end
