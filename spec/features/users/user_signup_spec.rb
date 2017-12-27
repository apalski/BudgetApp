require "rails_helper"
require "./app/models/user"

describe User do
  scenario "can signup for a new account" do
    visit new_user_path

    fill_in "Email", with: "marydoe@gmail.com"
    fill_in "Name", with: "Mary Doe"
    fill_in "Password", with: "secretsausage"
    click_on "Create User"

    expect(page).to have_content("You have successfully joined Budget App")
  end

  scenario "can't signup for a new account without a password" do
    visit new_user_path

    fill_in "Email", with: "marydoe@gmail.com"
    fill_in "Name", with: "Mary Doe"
    click_on "Create User"

    expect(page).to have_content("Password can't be blank")
  end

  scenario "can't signup for a new account without an email" do
    visit new_user_path

    fill_in "Name", with: "Mary Doe"
    fill_in "Password", with: "secretsausage"
    click_on "Create User"

    expect(page).to have_content("Email can't be blank")
  end

  scenario "can't signup for a new account without a name" do
    visit new_user_path

    fill_in "Email", with: "marydoe@gmail.com"
    fill_in "Password", with: "secretsausage"
    click_on "Create User"

    expect(page).to have_content("Name can't be blank")
  end

  scenario "can't signup for a new account with the same details again" do
    user = User.create(name: "Mary Doe",
                       email: "marydoe@gmail.com",
                       password: "secretsquirrel",
                       uid: "123")
    user.save!

    visit new_user_path

    fill_in "Name", with: "Mary Doe"
    fill_in "Email", with: "marydoe@gmail.com"
    fill_in "Password", with: "secretsausage"
    click_on "Create User"

    expect(page).to have_content(
      "Name has already been taken Email has already been taken")
  end
end
