require "rails_helper"

feature "view single income" do
  scenario "successfully" do
    user = create(:user)
    budget = create(:budget, user: user)
    log_in_as user
    income = create(:income, budget: budget)

    visit income_path(income)

    expect(page).to have_text(I18n.t("incomes.show.title", name: income.name))
  end
end
