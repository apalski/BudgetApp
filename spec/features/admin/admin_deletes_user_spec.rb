require "rails_helper"

feature "admin deletes user" do
  scenario "successfully" do
    admin = create(:user, :admin)
    user = create(:user)
    notice = I18n.t("flash.actions.destroy.notice", resource_name: "User")
    log_in_as admin

    visit admin_users_path
    within "#user_#{user.id}" do
      click_on I18n.t("admin.users.index.links.delete")
    end

    expect(page).to have_text(I18n.t("admin.users.index.title"))
    expect(page).to have_text(notice)
  end
end
