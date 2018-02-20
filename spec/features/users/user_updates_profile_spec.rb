require "rails_helper"

feature "user updates profile" do
  scenario "successfully" do
    user = create(:user)
    log_in_as user

    visit edit_users_path

    fill_in "user_email", with: "JT@example.com"
    fill_in "user_name", with: user.name
    click_on I18n.t("users.edit.submit")

    expect(page).to have_text("JT@example.com")
    expect(page).
      to have_text(I18n.t(
        "flash.actions.update.notice",
        resource_name: "User"
      ))
  end
end
