require "rails_helper"

feature "delete expense" do
  scenario "successfully" do
    budget = create(:budget)
    log_in_as budget.user
    expense = create(:expense)

    visit edit_expense_path(expense)

    click_on I18n.t("expenses.edit.delete")

    expect(page).to have_text(I18n.t("expenses.new.title"))
    expect(page).
      to have_text(I18n.t(
        "flash.actions.destroy.notice",
        resource_name: "Expense"
      ))
  end
end
