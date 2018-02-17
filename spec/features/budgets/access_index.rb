require "rails_helper"

feature "access index" do
  scenario "successfully" do
    user = create(:user)
    log_in_as user
    budget1 = create(:budget)
    budget2 = create(:budget)

    visit budgets_path

    expect(page).to have_text(I18n.t("budgets.index.title"))
    expect(page).to have_text(budget1.name)
    expect(page).to have_text(budget2.name)
    expect(Budget.all.count).to eq 2
  end
end
