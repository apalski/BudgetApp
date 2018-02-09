require "rails_helper"

feature "access expenses" do
  scenario "view all expenses" do
    expense1 = create(:expense)
    expense2 = create(:expense)

    visit expenses_path

    expect(page).to have_text(I18n.t("expenses.index.title"))
    expect(page).to have_text(expense1.name)
    expect(page).to have_text(expense2.name)
    expect(Expense.all.count).to eq 2
  end

  scenario "create new expense" do
    visit new_expense_path
    fill_in "expense_name", with: "Gas"
    select "1", from: "expense_due_date_3i"
    select "April", from: "expense_due_date_2i"
    select "2017", from: "expense_due_date_1i"
    select "Monthly", from: "expense_frequency"
    fill_in "expense_bill_estimate", with: 500
    click_on I18n.t("helpers.submit.expense.create")

    expect(page).to have_text(I18n.t("expenses.show.title", name: "Gas"))
    expect(page).
      to have_text(I18n.t(
        "flash.actions.create.notice",
        resource_name: "Expense"
      ))
  end

  scenario "view single expense" do
    expense = create(:expense)

    visit expense_path(expense)

    expect(page).to have_text(I18n.t("expenses.show.title", name: expense.name))
  end

  scenario "edit expense" do
    expense = create(:expense)

    visit edit_expense_path(expense)
    select "Monthly", from: "expense_frequency"
    click_on I18n.t("helpers.submit.expense.update")

    expect(page).to have_text("Monthly")
    expect(page).
      to have_text(I18n.t(
        "flash.actions.update.notice",
        resource_name: "Expense"
      ))
  end

  scenario "delete expense" do
    expense = create(:expense)

    visit edit_expense_path(expense)

    click_on I18n.t("expenses.edit.delete")

    expect(page).to have_text(I18n.t("expenses.new.title"))
    expect(page).
      to have_text(I18n.t(
        "flash.actions.destroy.notice",
        resource_name: "Expense"
      ))
  end
end
