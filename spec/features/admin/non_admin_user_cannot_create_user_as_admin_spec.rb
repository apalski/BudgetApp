require "rails_helper"

feature "Non admin user cannot create user as admin" do
  scenario "successfully" do
    user = create(:user)
    log_in_as user

    visit new_admin_user_path

    expect(page).to have_text(I18n.t("admin.defaults.require_admin"))
  end
end
