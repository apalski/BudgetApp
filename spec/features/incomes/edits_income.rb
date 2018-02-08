require "rails_helper"

feature "edits income" do
  scenario "successfully" do
    user = create(:user)
    create(:budget, user: user)
    log_in_as user
    income = create(:income)

    visit edit_income_path(income)
    select "Monthly", from: "income_frequency"
    click_on I18n.t("helpers.submit.income.update")

    expect(page).to have_text("Monthly")
    expect(page).
      to have_text(I18n.t(
        "flash.actions.update.notice",
        resource_name: "Income"
      ))
  end
end
