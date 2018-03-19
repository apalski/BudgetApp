require "rails_helper"

feature "view single income" do
  scenario "successfully" do
    income = create(:income, budget: budget)
    log_in_as income.budget.user

    visit income_path(income)

    expect(page).to have_text(I18n.t("incomes.show.title", name: income.name))
  end
end
