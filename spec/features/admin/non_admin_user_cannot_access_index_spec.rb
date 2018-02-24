require "rails_helper"

feature "Non admin user cannot access index" do
  scenario "successfully" do
    user = create(:user)
    log_in_as user

    visit admin_users_path

    expect(page).to have_text(I18n.t("admin.defaults.require_admin"))
  end
end
