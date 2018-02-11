require "rails_helper"

feature "access goals" do
  scenario "view all goals" do
    goal1 = create(:goal)
    goal2 = create(:goal)

    visit goals_path

    expect(page).to have_text(I18n.t("goals.index.title"))
    expect(page).to have_text(goal1.name)
    expect(page).to have_text(goal2.name)
    expect(Goal.all.count).to eq 2
  end

  scenario "create new goal" do
    visit new_goal_path
    fill_in "goal_name", with: "Holiday"
    select "1", from: "goal_due_date_3i"
    select "April", from: "goal_due_date_2i"
    select "2019", from: "goal_due_date_1i"
    fill_in "goal_amount", with: 500
    click_on I18n.t("helpers.submit.goal.create")

    expect(page).to have_text(I18n.t("goals.show.title", name: "Holiday"))
    expect(page).
      to have_text(I18n.t(
        "flash.actions.create.notice",
        resource_name: "Goal"
      ))
  end

  scenario "view single goal" do
    goal = create(:goal)

    visit goal_path(goal)

    expect(page).to have_text(I18n.t("goals.show.title"))
  end

  scenario "edit goal" do
    goal = create(:goal)

    visit edit_goal_path(goal)
    fill_in "goal_name", with: "Managed Fund"
    click_on I18n.t("helpers.submit.goal.update")

    expect(page).to have_text("Managed Fund")
    expect(page).
      to have_text(I18n.t(
        "flash.actions.update.notice",
        resource_name: "Goal"
      ))
  end

  scenario "delete goal" do
    goal = create(:goal)

    visit edit_goal_path(goal)

    click_on I18n.t("goals.edit.delete")

    expect(page).to have_text(I18n.t("goals.new.title"))
    expect(page).
      to have_text(I18n.t(
        "flash.actions.destroy.notice",
        resource_name: "Goal"
      ))
  end
end
