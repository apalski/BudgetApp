require "rails_helper"

feature "delete goal" do
  scenario "successfully" do
    user = create(:user)
    create(:budget, user: user)
    log_in_as user
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
