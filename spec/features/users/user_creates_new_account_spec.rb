require "rails_helper"

feature "user creates new account" do
  scenario "successfully" do
    visit new_users_path

    fill_in "user_name", with: "Mary"
    fill_in "user_email", with: "Mary@example.com"
    fill_in "user_email_confirmation", with: "Mary@example.com"
    fill_in "user_password", with: "secret"
    click_on I18n.t("helpers.submit.user.create")

    expect(page).to have_text(I18n.t("users.show.welcome"))
    expect(page).
      to have_text(I18n.t("sessions.new.flash.alert"))
    expect(page).not_to have_text(I18n.t(
      "flash.actions.create.notice",
      resource_name: "User",
    ))
    expect(current_path).to eq(users_path)
  end
end
