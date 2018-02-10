require "rails_helper"

feature "creates new budget" do
  scenario "successfully" do
    create(:user)
    log_in_as user

    visit new_budget_path
    fill_in "budget_name", with: "My Budget"
    fill_in "budget_budget_type", with: "Holiday"
    click_on I18n.t("helpers.submit.budget.create")

    expect(page).to have_text(
      I18n.t("budgets.show.title", name: "My Budget")
    )
    expect(page).to have_text(
      I18n.t("flash.actions.create.notice", resource_name: "Budget")
    )
    expect(user.budgets.count).to eq 1
  end
end
