require "rails_helper"

feature "view single expense" do
  scenario "successfully" do
    user = create(:user)
    log_in_as user
    expense = create(:expense)

    visit expense_path(expense)

    expect(page).to have_text(I18n.t("expenses.show.title", name: expense.name))
  end
end
