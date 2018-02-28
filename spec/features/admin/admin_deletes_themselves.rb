require "rails_helper"

feature "admin deletes themselves" do
  scenario "and is logged out" do
    admin = create(:user, :admin)
    log_in_as admin

    visit admin_users_path
    click_on I18n.t("admin.users.delete.submit")

    log_in_as user

    expect(page).to have_text(I18n.t("sessions.create.flash.alert"))
    expect(current_path).to eq new_session_path
  end
end
