require "rails_helper"

feature "delete expense" do
  scenario "successfully" do
    user = create(:user)
    create(:budget, user: user)
    log_in_as user
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
