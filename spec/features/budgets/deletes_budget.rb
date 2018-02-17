require "rails_helper"

feature "delete budget" do
  scenario "successfully" do
    user = create(:user)
    log_in_as user
    budget = create(:budget)

    visit edit_budget_path(budget)

    click_on I18n.t("budgets.edit.delete")

    expect(page).to have_text(I18n.t("budgets.new.title"))
    expect(page).
      to have_text(I18n.t(
        "flash.actions.destroy.notice",
        resource_name: "Budget"
      ))
  end
end
