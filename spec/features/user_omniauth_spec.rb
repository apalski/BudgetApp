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
  end
end
