require "rails_helper"

feature "create new goal" do
  scenario "successfully" do
    user = create(:user)
    create(:budget, user: user)
    log_in_as user

    visit new_goal_path
    fill_in "goal_name", with: "Holiday"
    select "1", from: "goal_due_date_3i"
    select "April", from: "goal_due_date_2i"
    select "2017", from: "goal_due_date_1i"
    fill_in "goal_amount", with: 1000
    click_on I18n.t("helpers.submit.goal.create")

    expect(page).to have_text(I18n.t("goals.show.title", name: "Holiday"))
    expect(page).
      to have_text(I18n.t(
        "flash.actions.create.notice",
        resource_name: "Goal"
      ))
  end
end
