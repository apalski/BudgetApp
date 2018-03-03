require "rails_helper"

feature "view single goal" do
  scenario "successfully" do
    user = create(:user)
    create(:budget, user: user)
    log_in_as user
    goal = create(:goal, name: "Holiday")

    visit goal_path(goal)

    expect(page).to have_text(I18n.t("goals.show.title", name: "Holiday"))
  end
end
