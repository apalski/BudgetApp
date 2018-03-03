require "rails_helper"

feature "user sees only their goals" do
  scenario "successfully" do
    user = create(:user)
    budget = create(:budget, user: user)
    user_goal = create(:goal, budget: budget)
    other_goal = create(:goal)
    log_in_as user

    visit goals_path

    expect(page).to have_text(I18n.t("goals.index.title"))
    expect(page).to have_text(user_goal.name)
    expect(page).not_to have_text(other_goal.name)
  end
end
