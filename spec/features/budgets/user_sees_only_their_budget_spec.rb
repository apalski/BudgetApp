require "rails_helper"

feature "user sees only their budget" do
  scenario "successfully" do
    user = create(:user)
    user_budget = create(:budget, user: user)
    other_budget = create(:budget)
    log_in_as user

    visit budgets_path

    expect(page).to have_text(I18n.t("budgets.show.title"))
    expect(page).to have_text(user_budget.name)
    expect(page).not_to have_text(other_budget.name)
  end
end
