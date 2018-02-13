require "rails_helper"

feature "user creates new account" do
  scenario "successfully without login" do
    visit new_user_path

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

  scenario "views show page" do
    user = create(:user)
    feature_log_in_as user

    visit user_path(user)

    expect(page).to have_text(I18n.t("users.show.welcome", name: user.name))
  end

  scenario "updates profile" do
    user = create(:user)
    feature_log_in_as user

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

  scenario "deletes account" do
    user = create(:user)
    feature_log_in_as user

    visit edit_user_path(user)

    click_on I18n.t("users.edit.delete")

    expect(page).to have_text(I18n.t("users.new.title"))
    expect(page).
      to have_text(I18n.t(
        "flash.actions.destroy.notice",
        resource_name: "User"
      ))
  end
end
