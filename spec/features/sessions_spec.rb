require "rails_helper"

feature "user can control their own account session" do
  scenario "by logging into their account" do
    visit login_path

    fill_in "Email", with: "mary@example.com"
    fill_in "Password", with: "secret"
    click_on I18n.t("sessions.new.submit")

    expect(page).to have_text(I18n.t("users.show.welcome", name: "Mary"))
    expect(page).
      to have_text(I18n.
        t("flash.actions.create.notice", resource_name: t(".session")))
    expect(current_user).to exist
  end

  scenario "by logging out of their account" do
    user = create(:user)
    visit users_path(user)

    click_on I18n.t("sessions.destroy.submit")

    expect(page).to have_text(I18n.t("home.welcome"))
    expect(page).
      to have_text(I18n.
        t("flash.actions.destroy.notice", resource_name: t(".session")))
    expect(current_user).not_to exist
  end
end
