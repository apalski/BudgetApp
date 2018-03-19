require "rails_helper"

feature "user sees only their incomes" do
  scenario "successfully" do
    user = create(:user)
    budget = create(:budget, user: user)
    user_income = create(:income, budget: budget)
    other_income = create(:income)
    log_in_as user

    visit incomes_path

    expect(page).to have_text(I18n.t("incomes.index.title"))
    expect(page).to have_text(user_income.name)
    expect(page).not_to have_text(other_income.name)
  end
end
