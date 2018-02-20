require "rails_helper"

feature "user creates new account" do
  scenario "successfully" do
    visit new_users_path

    fill_in "user_name", with: "Mary"
    fill_in "user_email", with: "Mary@example.com"
    fill_in "user_password", with: "secret"
    click_on I18n.t("helpers.submit.user.create")

    expect(page).to have_text(I18n.t("sessions.new.title"))
    expect(page).
      to have_text(I18n.t(
        "flash.actions.create.notice",
        resource_name: "User"
      ))
  end
end
