require 'spec_helper'

describe User do
  before do
    @user = build :user
  end

  context 'regular registering' do
    it 'allows user to sign in correctly' do
      create_user_and_sign_in
      page.should have_content "You have signed up successfully."
    end

    it 'gives an error if missing required fields' do
      visit root_path
      click_link 'Sign up'
      click_button 'Sign up'
      page.should have_content "errors prohibited this user from being saved:"
      page.should have_content "Email can't be blankPassword can't be blankName can't be blankUsername can't be blank"
    end
  end
end

# feature 'Google signin' do
#   scenario 'allows user to sign in with Google credentials' do
#     Capybara.current_driver = :poltergeist
#     login_with_oauth
#     page.should have_content "Successfully authenticated from Google account."
#   end
# end
