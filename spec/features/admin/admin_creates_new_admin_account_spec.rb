require "rails_helper"

feature "admin creates new admin account" do
  scenario "successfully" do
    user = create(:user, admin: true)
    log_in_as user

    visit new_admin_user_path
    fill_in "user_name", with: "Mary"
    fill_in "user_email", with: "Mary@example.com"
    choose "Yes"
    fill_in "user_password", with: "secret"
    click_on I18n.t("admin.users.new.submit")

    expect(user.admin).to eq true
    expect(page).to have_text(I18n.t("admin.users.index.title"))
    expect(page).
      to have_text(I18n.t(
        "flash.actions.create.notice",
        resource_name: "User"
      ))
  end
end
