require "rails_helper"

feature "user deletes account" do
  scenario "successfully" do
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
