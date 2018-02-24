require "rails_helper"

feature "Non admin user cannot edit user as admin" do
  scenario "successfully" do
    user = create(:user)
    other_user = create(:user)
    log_in_as user

    visit admin_users_path(other_user)

    expect(page).to have_text(I18n.t("admin.defaults.require_admin"))
  end
end
