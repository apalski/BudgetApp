require "rails_helper"

feature "admin views all users" do
  scenario "successfully" do
    user = create(:user, admin: true)
    log_in_as user

    visit admin_users_path

    expect(page).to have_text(I18n.t("admin.users.index.title"))
  end
end
