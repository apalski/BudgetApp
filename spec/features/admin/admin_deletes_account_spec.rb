require "rails_helper"

feature "admin deletes account" do
  scenario "successfully" do
    skip
    user = create(:user, admin: true)
    log_in_as user

    visit admin_edit_user_path(user)

    click_on I18n.t("users.edit.delete")

    expect(page).to have_text(I18n.t("users.new.title"))
    expect(page).
      to have_text(I18n.t(
        "flash.actions.destroy.notice",
        resource_name: "User"
      ))
  end
end
