require "rails_helper"

feature "user updates profile" do
  scenario "successfully" do
    user = create(:user)
    log_in_as user

    visit edit_user_path(user)

    fill_in "user_email", with: "JT@example.com"
    click_on I18n.t("helpers.submit.user.update")

    expect(page).to have_text("JT@example.com")
    expect(page).
      to have_text(I18n.t(
        "flash.actions.update.notice",
        resource_name: "User"
      ))
  end
end
