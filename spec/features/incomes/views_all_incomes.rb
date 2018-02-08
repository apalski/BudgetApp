require "rails_helper"

feature "views all incomes" do
  scenario "successfully" do
    user = create(:user)
    create(:budget, user: user)
    log_in_as user
    income1 = create(:income)
    income2 = create(:income)

    visit incomes_path

    expect(page).to have_text(I18n.t("incomes.index.title"))
    expect(page).to have_text(income1.name)
    expect(page).to have_text(income2.name)
    expect(Income.all.count).to eq 2
  end
end
