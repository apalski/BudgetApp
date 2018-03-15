require "rails_helper"

feature "edits expense" do
  scenario "successfully" do
    user = create(:user)
    expense = create(:expense, frequency: "weekly", user: user)
    log_in_as user

    visit edit_expense_path(expense)
    select "monthly", from: "expense_frequency"
    click_on I18n.t("helpers.submit.expense.update")

    expect(page).to have_text("Monthly")
    expect(page).
      to have_text(I18n.t(
        "flash.actions.update.notice",
        resource_name: "Expense",
      ),)
  end
end
