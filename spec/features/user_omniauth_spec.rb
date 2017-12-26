require "rails_helper"
require "./app/models/user"

describe "User" do
  context "when signing up with omniauth" do
    it "should be created" do
      visit '/'
      page.should have_content("Sign in with Facebook")
      mock_auth_hash
      click_link "Sign in"
      page.should have_content("mockuser")
      page.should have_content("Sign out")
    end

    it "can handle authentication error" do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    visit '/'
    page.should have_content("Sign in with Facebook")
    click_link "Sign in"
    page.should have_content('Authentication failed.')
  end
  end
end
