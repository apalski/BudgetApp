require "rails_helper"
require "./app/models/user"

describe "User signing in with omniauth" do
  scenario "should be created" do
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

    expect(page).to have_content("Sign in with Facebook")

    click_on "Sign in with Facebook"

    expect(page).to have_content("mockuser")
  end

  scenario "can handle authentication error" do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials

    visit new_session_path

    expect(page).to have_content("Sign in with Facebook")

    click_on "Sign in with Facebook"

    expect(page).to have_content('Authentication failed.')
  end
end
