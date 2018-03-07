require "rails_helper"

feature "admin creates new admin account" do
  scenario "successfully" do
    admin = create(:user, :admin)
    log_in_as admin

    visit new_admin_user_path
    fill_in "user_name", with: "Mary"
    fill_in "user_email", with: "Mary@example.com"
    fill_in "user_email_confirmation", with: "Mary@example.com"
    choose "Yes"
    fill_in "user_password", with: "secret"
    click_on I18n.t("admin.users.new.submit")

    user = User.last

    expect(page).to have_text(I18n.t("admin.users.index.title"))
    expect(page).
      to have_text(I18n.t(
        "flash.actions.create.notice",
        resource_name: "User",
      ),)
    within "#user_#{user.id}" do
      expect(page).to have_text("Mary")
      expect(page).to have_text("true")
    end
  end
end
