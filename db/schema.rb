ActiveRecord::Schema.define(version: 20180201054016) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.string "name", null: false
    t.integer "frequency", null: false
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
    t.bigint "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_expenses_on_budget_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.string "name", null: false
    t.date "due_date"
    t.string "frequency", null: false
    t.decimal "amount"
    t.bigint "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_incomes_on_budget_id"
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
