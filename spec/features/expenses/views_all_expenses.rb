require "rails_helper"

feature "view all expenses" do
  scenario "successfully" do
    budget = create(:budget)
    log_in_as budget.user
    expense1 = create(:expense)
    expense2 = create(:expense)

    visit expenses_path

    expect(page).to have_text(I18n.t("expenses.index.title"))
    expect(page).to have_text(expense1.name)
    expect(page).to have_text(expense2.name)
    expect(Expense.all.count).to eq 2
  end
end
