require "rails_helper"
require "./app/models/user"

describe "User" do
  context "when signing up with omniauth" do
    it "should be created" do
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
      visit new_session_path
      expect(page).to have_content("Access with Facebook")
      click_on "Access with Facebook"
      expect(page).to have_content("mockuser")
    end

    it "can handle authentication error" do
      OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
      visit new_session_path
      expect(page).to have_content("Access with Facebook")
      click_on "Access with Facebook"
      expect(page).to have_content('Authentication failed.')
    end
  end
end
