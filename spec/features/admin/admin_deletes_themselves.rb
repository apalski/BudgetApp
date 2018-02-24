require "rails_helper"

feature "admin deletes themselves" do
  scenario "and is logged out" do
    user = create(:user, admin: true)
    log_in_as user

    visit admin_users_path
    click_on I18n.t("admin.users.delete.submit")

    log_in_as user

    expect(page).to have_text(I18n.t("sessions.create.flash.alert"))
  end
end
