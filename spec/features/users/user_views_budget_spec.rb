require "rails_helper"

feature "user views budget" do
  scenario "successfully" do
    user = create(:user)
    log_in_as user

    visit user_path(user)

    expect(page).to have_text(I18n.t("users.show.welcome"))
  end
end
