require "rails_helper"

feature "creates new budget" do
  scenario "successfully" do
    create(:user)
    notice = I18n.t("flash.actions.create.notice", resource_name: "Budget")
    notice2 = I18n.t("budgets.show.title", name: "My Budget")
    log_in_as user

    visit new_budget_path
    fill_in "budget_name", with: "My Budget"
    select "monthly", from: "budget_frequency"
    click_on I18n.t("helpers.submit.budget.create")

    expect(page).to have_text(notice2)
    expect(page).to have_text(notice)
    expect(user.budgets.count).to eq 1
  end
end
