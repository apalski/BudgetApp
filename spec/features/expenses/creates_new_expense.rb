require "rails_helper"

feature "create new expense" do
  scenario "successfully" do
    budget = create(:budget)
    log_in_as budget.user

    visit new_expense_path
    fill_in "expense_name", with: "Gas"
    select "1", from: "expense_due_date_3i"
    select "April", from: "expense_due_date_2i"
    select "2017", from: "expense_due_date_1i"
    select "Monthly", from: "expense_frequency"
    fill_in "expense_bill_estimate", with: 500
    click_on I18n.t("helpers.submit.expense.create")

    expect(page).to have_text(I18n.t("expenses.show.title", name: "Gas"))
    expect(page).
      to have_text(I18n.t(
        "flash.actions.create.notice",
        resource_name: "Expense"
      ))
  end
end
