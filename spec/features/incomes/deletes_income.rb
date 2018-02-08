require "rails_helper"

feature "delete income" do
  scenario "successfully" do
    user = create(:user)
    create(:budget, user: user)
    log_in_as user
    income = create(:income)

    visit edit_income_path(income)

    click_on I18n.t("incomes.edit.delete")

    expect(page).to have_text(I18n.t("incomes.new.title"))
    expect(page).
      to have_text(I18n.t(
        "flash.actions.destroy.notice",
        resource_name: "Income"
      ))
  end
end
