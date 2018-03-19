require "rails_helper"

feature "delete income" do
  scenario "successfully" do
    user = create(:user)
    budget = create(:budget, user: user)
    income = create(:income, budget: budget)
    notice = I18n.t("flash.actions.destroy.notice", resource_name: "Income")
    log_in_as user

    visit edit_income_path(income)
    click_on I18n.t("incomes.edit.delete")

    expect(page).to have_text(I18n.t("incomes.new.title"))
    expect(page).to have_text(notice)
    expect(page).not_to have_text(income.name)
  end
end
