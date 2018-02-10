require "rails_helper"

feature "user creates new session" do
  scenario "successfully" do
    user = create(:user)

    visit login_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password
    click_on I18n.t("sessions.new.submit")

    expect(page).to have_text(I18n.t("users.show.welcome", name: user.name))
    expect(page).
      to have_text(I18n.
        t("sessions.create.notice"))
  end

  scenario "logs out" do
    user = create(:user)

    visit login_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password
    click_on I18n.t("sessions.new.submit")

    click_on I18n.t("sessions.destroy.link")

    expect(page).to have_text(I18n.t("home.show.welcome"))
    expect(page).
      to have_text(I18n.
        t("flash.actions.destroy.notice", resource_name: "Session"))
  end
end
