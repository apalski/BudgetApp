require "rails_helper"

feature "views show page" do
  scenario "successfully" do
    user = create(:user)
    budget = create(:budget, user: user)
    log_in_as user

    visit budget_path(budget)

    expect(page).to have_text(I18n.t("budgets.show.title", name: budget.name))
  end

  scenario "correct expenses total shows" do
    user = create(:user)
    budget = create(:budget, user: user)
    create(:expense, bill_estimate: 50, budget: budget)
    create(:expense, bill_estimate: 150, budget: budget)
    log_in_as user

    visit budget_path(budget)

    expect(page).to have_text("$250.00")
  end
end
