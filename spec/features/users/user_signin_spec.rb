# frozen_string_literal: true

require 'rails_helper'
require './app/models/user'

describe User do
  scenario 'can sign in to their account with correct details' do
    user = User.create(name: 'John Doe',
                       email: 'user@gmail.com',
                       password: 'secret',
                       uid: '123')
    user.save!

    visit new_session_path

    fill_in 'Name', with: 'John Doe'
    fill_in 'Password', with: 'secret'
    click_on 'Sign In'

    expect(page).to have_content('Welcome to Budget App John Doe')
  end

  scenario "can't sign in to their account without correct details" do
    user = User.create(name: 'John Doe',
                       email: 'user@gmail.com',
                       password: 'secret',
                       uid: '123')
    user.save!

    visit new_session_path

    fill_in 'Name', with: 'Jon Doe'
    fill_in 'Password', with: 'secret'
    click_on 'Sign In'

    expect(page).to have_content(
      "You couldn't be signed in"
    )
  end

  scenario "can't sign in when not authenticated" do
    user = User.create(name: 'John Doe',
                       email: 'user@gmail.com',
                       password: 'secret',
                       uid: '123')
    user.save!

    visit new_session_path

    fill_in 'Name', with: 'John Doe'
    fill_in 'Password', with: 'notright'
    click_on 'Sign In'

    expect(page).to have_content(
      "You couldn't be signed in"
    )
  end
end
