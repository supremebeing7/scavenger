require 'spec_helper'

describe User do
  before do
    @user = build :user
  end

  context 'regular registering' do
    it 'allows user to sign in correctly' do
      create_user_and_sign_in
      page.should have_content "Sign up complete"
    end

    it 'gives an error if missing required fields' do

    end
  end

  # context 'Google signin' do
  #   it 'allows user to sign in with Google credentials' do

  #     page.should have_content "Successfully authenticated from Google account."
  #   end
  # end
end
