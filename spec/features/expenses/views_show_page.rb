require "rails_helper"

feature "view single expense" do
  scenario "successfully" do
    user = create(:user)
    create(:budget, user: user)
    expense = create(:expense)
    log_in_as user

    visit expense_path(expense)

    expect(page).to have_text(I18n.t("expenses.show.title", name: expense.name))
  end
end
