# frozen_string_literal: true

require 'rails_helper'
require './app/models/user'

describe 'current_user' do
  scenario "can't sign in again" do
    user = User.create(name: 'John Doe',
                       email: 'user@gmail.com',
                       password: 'secret',
                       uid: '123')
    user.save!

    visit new_session_path

    fill_in 'Name', with: 'John Doe'
    fill_in 'Password', with: 'secret'
    click_on 'Sign In'

    click_on 'Sign in'

    expect(page).to have_content('You are already signed in')
  end

  scenario "can't access the sign up page" do
    user = User.create(name: 'John Doe',
                       email: 'user@gmail.com',
                       password: 'secret',
                       uid: '123')
    user.save!

    visit new_session_path

    fill_in 'Name', with: 'John Doe'
    fill_in 'Password', with: 'secret'
    click_on 'Sign In'

    click_on 'Sign up'

    expect(page).to have_content('You are already signed in')
  end
end
