require "rails_helper"

feature "access budgets" do
  scenario "view all budgets" do
    budget1 = create(:budget)
    budget2 = create(:budget)

    visit budgets_path

    expect(page).to have_text(I18n.t("budgets.index.title"))
    expect(page).to have_text(budget1.name)
    expect(page).to have_text(budget2.name)
    expect(Budget.all.count).to eq 2
  end

  scenario "creates new budget" do
    visit new_budget_path
    fill_in "budget_name", with: "My Budget"
    fill_in "budget_budget_type", with: "Holiday"
    click_on I18n.t("helpers.submit.budget.create")

    expect(page).to have_text(I18n.t("budgets.show.title", name: "My Budget"))
    expect(page).
      to have_text(I18n.t(
        "flash.actions.create.notice",
        resource_name: "Budget"
      ))
  end

  scenario "views show page" do
    budget = create(:budget)

    visit budget_path(budget)

    expect(page).to have_text(I18n.t("budgets.show.title", name: budget.name))
  end

  scenario "updates budget" do
    budget = create(:budget)

    visit edit_budget_path(budget)
    fill_in "budget_name", with: "My New Budget"
    click_on I18n.t("helpers.submit.budget.update")

    expect(page).to have_text("My New Budget")
    expect(page).
      to have_text(I18n.t(
        "flash.actions.update.notice",
        resource_name: "Budget"
      ))
  end

  scenario "delete budget" do
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
