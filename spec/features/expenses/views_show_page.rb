require "rails_helper"

feature "view single expense" do
  scenario "successfully" do
    budget = create(:budget)
    log_in_as budget.user
    expense = create(:expense)

    visit expense_path(expense)

    expect(page).to have_text(I18n.t("expenses.show.title", name: expense.name))
  end
end
