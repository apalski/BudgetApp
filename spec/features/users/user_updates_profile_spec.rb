require "rails_helper"

feature "user updates profile" do
  scenario "successfully" do
    user = create(:user)
    log_in_as user

    visit edit_users_path

    fill_in "user_name", with: "Fred"
    fill_in "user_email", with: "fred@example.com"
    click_on I18n.t("users.edit.submit")

    expect(page).to have_text("Fred")
    expect(page).
      to have_text(I18n.t(
        "flash.actions.update.notice",
        resource_name: "User",
      ),)
  end
end
