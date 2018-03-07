require "rails_helper"

feature "creates new income" do
  scenario "successfully" do
    user = create(:user)
    create(:budget, user: user)
    log_in_as user

    visit new_income_path
    fill_in "income_name", with: "Salary"
    select "1", from: "income_due_date_3i"
    select "April", from: "income_due_date_2i"
    select "2017", from: "income_due_date_1i"
    select "monthly", from: "income_frequency"
    fill_in "income_amount", with: 1000.00
    click_on I18n.t("helpers.submit.income.create")

    expect(page).to have_text(I18n.t("incomes.show.title", name: "Salary"))
    expect(page).
      to have_text(I18n.t(
        "flash.actions.create.notice",
        resource_name: "Income",
      ),)
  end
end
