require "rails_helper"

feature "admin views all users" do
  scenario "successfully" do
    user = create(:user, admin: true)
    log_in_as user

    visit users_path

    expect(page).to have_text(I18n.t("users.index.title"))
  end

  scenario "unsuccessfully" do
    user = create(:user)
    log_in_as user

    visit users_path

    expect(page).to have_text(I18n.t("users.show.welcome"))
    expect(page).to have_text(I18n.t("users.index.require_admin"))
  end
end
