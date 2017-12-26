require "rails_helper"
require "./app/models/user"

describe "User" do
  scenario "when they can't be authenticated" do
    user = User.create(name: "John Doe", email: "user@gmail.com", password: "secret", uid: "123")
    user.save!

    visit new_session_path

    fill_in "Name", with: "John Doe"
    fill_in "Password", with: "notright"
    click_on "Sign In"

    expect(page).to have_content("You couldn't be signed in, please check your name and password and try again")
  end
end
