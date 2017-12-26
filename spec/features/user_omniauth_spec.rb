require "rails_helper"
require "./app/models/user"

describe "User" do
  context "when signing up with omniauth" do
    it "should be created" do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = {
        'provider' => 'facebook',
        'uid' => '123545',
        'user_info' => {
          'name' => 'mockuser',
          'email' => 'mock@gmail.com'
        },
        'credentials' => {
          'token' => 'mock_token',
          'secret' => 'mock_secret'
        }
      }
      visit '/sessions/new'
      expect(page).to have_content("Sign in with Facebook")
      click_on "Sign in with Facebook"
      expect(page).to have_content("mockuser")
    end

    it "can handle authentication error" do
      OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
      visit '/sessions/new'
      expect(page).to have_content("Sign in with Facebook")
      click_on "Sign in with Facebook"
      expect(page).to have_content('Authentication failed.')
    end
  end
end
