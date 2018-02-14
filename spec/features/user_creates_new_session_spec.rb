require "rails_helper"

feature "user creates new session" do
  scenario "successfully" do
    user = create(:user)
    log_in_as user

    expect(page).to have_text(I18n.t("users.show.welcome", name: user.name))
    expect(page).to have_text(I18n.t("sessions.create.flash.notice"))
  end

  scenario "logs out" do
    user = create(:user)
    log_in_as user

    click_on I18n.t("sessions.destroy.link")

    expect(page).to have_text(I18n.t("home.show.welcome"))
    expect(page).to have_text(
      I18n.t("sessions.destroy.flash.notice", resource_name: "Session")
    )
  end
end
