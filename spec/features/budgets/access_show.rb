require "rails_helper"

feature "views show page" do
  scenario "successfully" do
    user = create(:user)
    budget = create(:budget, user: user)
    log_in_as user

    visit budget_path(budget)

    expect(page).to have_text(I18n.t("budgets.show.title", name: budget.name))
  end
end
