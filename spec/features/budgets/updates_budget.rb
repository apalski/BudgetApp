require "rails_helper"

feature "updates budget" do
  scenario "successfully" do
    user = create(:user)
    budget = create(:budget, user: user)
    notice = I18n.t("flash.actions.update.notice", resource_name: "Budget")
    log_in_as user

    visit edit_budget_path(budget)
    fill_in "budget_name", with: "My New Budget"
    select "fortnightly", from: "budget_frequency"
    click_on I18n.t("helpers.submit.budget.update")

    expect(page).to have_text("My New Budget")
    expect(page).to have_text(notice)
  end
end
