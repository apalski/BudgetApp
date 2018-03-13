require "rails_helper"

feature "delete expense" do
  scenario "successfully" do
    user = create(:user)
    create(:budget, user: user)
    expense = create(:expense)
    notice = I18n.t("flash.actions.destroy.notice", resource_name: "Expense")
    log_in_as user

    visit edit_expense_path(expense)

    click_on I18n.t("expenses.edit.delete")

    expect(page).to have_text(I18n.t("expenses.index.title"))
    expect(page).to have_text(notice)
    expect(page).not_to have_text(expense.name)
  end
end
