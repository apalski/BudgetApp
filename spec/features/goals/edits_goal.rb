require "rails_helper"

feature "edits goal" do
  scenario "successfully" do
    user = create(:user)
    create(:budget, user: user)
    log_in_as user
    goal = create(:goal)

    visit edit_goal_path(goal)
    fill_in "goal_name", with: "Apartment"
    click_on I18n.t("helpers.submit.goal.update")

    expect(page).to have_text("Apartment")
    expect(page).
      to have_text(I18n.t(
        "flash.actions.update.notice",
        resource_name: "Goal"
      ))
  end
end
