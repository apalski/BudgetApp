require "rails_helper"

feature "view all goals" do
  scenario "successfully" do
    user = create(:user)
    create(:budget, user: user)
    log_in_as user
    goal1 = create(:goal)
    goal2 = create(:goal)

    visit goals_path

    expect(page).to have_text(I18n.t("goals.index.title"))
    expect(page).to have_text(goal1.name)
    expect(page).to have_text(goal2.name)
    expect(Goal.all.count).to eq 2
  end
end
