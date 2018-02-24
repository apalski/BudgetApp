require "rails_helper"

feature "Admin edits user" do
  scenario "successfully" do
    user = create(:user, admin: true)
    other_user = create(:user)
    log_in_as user

    visit admin_users_path
    within "#user_#{user.id}" do
      click_on I18n.t("admin.users.index.links.edit")
    end
    fill_in "user_name", with: "Mary"
    fill_in "user_email", with: "Mary@example.com"
    click_on I18n.t("admin.users.edit.submit")

    expect(page).to have_text(I18n.t("admin.users.index.title"))
  end
end
