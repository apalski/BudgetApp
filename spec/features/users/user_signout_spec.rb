require "rails_helper"
require "./app/models/user"

describe User do
  scenario "can sign out of their account" do
    user = User.create(name: "John Doe",
                       email: "user@gmail.com",
                       password: "secret",
                       uid: "123")
    user.save!

    visit new_session_path

    fill_in "Name", with: "John Doe"
    fill_in "Password", with: "secret"
    click_on "Sign In"

    click_on "Sign out"

    expect(page).to have_content("You are signed out")
  end
end
