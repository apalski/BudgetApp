require "rails_helper"

feature "edits income" do
  scenario "successfully" do
    user = create(:user)
    create(:budget, user: user)
    income = create(:income, frequency: "weekly")
    notice = I18n.t("flash.actions.update.notice", resource_name: "Income")
    log_in_as user

    visit edit_income_path(income)
    select "monthly", from: "income_frequency"
    click_on I18n.t("helpers.submit.income.update")

    expect(page).to have_text("monthly")
    expect(page).to have_text(notice)
  end
end
