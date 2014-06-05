require 'spec_helper'

feature Crawl do
  before do
    @crawl = build :crawl
  end

  context 'create' do
    it 'allows a registered user to create a new crawl' do
      create_user_and_sign_in
      create_new_crawl
      page.should have_content @crawl.name
    end

  #   it 'gives an error if missing required fields' do
  #     visit root_path
  #     click_link 'Sign up'
  #     click_button 'Sign up'
  #     page.should have_content "errors prohibited this user from being saved:"
  #     page.should have_content "Email can't be blankPassword can't be blankName can't be blankUsername can't be blank"
  #   end
  end
end
