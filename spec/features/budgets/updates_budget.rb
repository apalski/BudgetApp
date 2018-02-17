require "rails_helper"

feature "updates budget" do
  scenario "successfully" do
    user = create(:user)
    log_in_as user
    budget = create(:budget)

    visit edit_budget_path(budget)
    fill_in "budget_name", with: "My New Budget"
    click_on I18n.t("helpers.submit.budget.update")

    expect(page).to have_text("My New Budget")
    expect(page).
      to have_text(I18n.t(
        "flash.actions.update.notice",
        resource_name: "Budget"
      ))
  end
end
