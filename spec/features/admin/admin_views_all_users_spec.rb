require "rails_helper"

feature "admin views all users" do
  scenario "successfully" do
    admin = create(:user, :admin, name: "John", id: 2)
    user_1 = create(:user, name: "Will", id: 6)
    user_2 = create(:user, name: "Alice", id: 3)
    log_in_as admin

    visit admin_users_path

    expect(page).to have_text(I18n.t("admin.users.index.title"))
    expect(page).to have_text(admin.name)
    expect(page).to have_text(user_1.name)
    expect(page).to have_selector("ul#user_#{user_2.id}")
  end
end
