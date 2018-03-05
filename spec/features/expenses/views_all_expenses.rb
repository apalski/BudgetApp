require "rails_helper"

feature "view all expenses" do
  scenario "successfully" do
    user = create(:user)
    create(:budget, user: user)
    expense1 = create(:expense)
    expense2 = create(:expense)
    log_in_as user

    visit expenses_path

    expect(page).to have_text(I18n.t("expenses.index.title"))
    expect(page).to have_text(expense1.name)
    expect(page).to have_text(expense2.name)
  end
end