require "rails_helper"

feature "user sees only their expenses" do
  scenario "successfully" do
    user = create(:user)
    user_expense = create(:expense, user: user)
    other_expense = create(:expense)
    log_in_as user

    visit expenses_path

    expect(page).to have_text(I18n.t("expenses.index.title"))
    expect(page).to have_text(user_expense.name)
    expect(page).not_to have_text(other_expense.name)
  end
end
