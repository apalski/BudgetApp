require "rails_helper"

feature "admin views all users" do
  scenario "successfully" do
    admin = create(:user, :admin, name: "John")
    create(:user, name: "Will")
    log_in_as admin

    visit admin_users_path

    expect(page).to have_text(I18n.t("admin.users.index.title"))
    expect(page).to have_text("John")
    expect(page).to have_text("Will")
  end
end
