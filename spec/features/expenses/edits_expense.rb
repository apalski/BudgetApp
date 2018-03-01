require "rails_helper"

feature "edits expense" do
  scenario "successfully" do
    budget = create(:budget)
    log_in_as budget.user
    expense = create(:expense)

    visit edit_expense_path(expense)
    select "Monthly", from: "expense_frequency"
    click_on I18n.t("helpers.submit.expense.update")

    expect(page).to have_text("Monthly")
    expect(page).
      to have_text(I18n.t(
        "flash.actions.update.notice",
        resource_name: "Expense"
      ))
  end
end
