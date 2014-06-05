def create_user_and_sign_in
  @user = build :user
  visit '/'
  click_link 'Sign up'
  fill_in 'Name', with: @user.name
  fill_in 'Email', with: @user.email
  fill_in 'Username', with: @user.username
  fill_in 'Password', with: @user.password
  fill_in 'Password confirmation', with: @user.password
  click_button 'Sign up'
end

def create_new_crawl
  @crawl = build :crawl
  visit new_crawl_path
  fill_in 'Name', with: @crawl.name
  fill_in 'Description', with: @crawl.description
  choose 'Public'
  click_button 'Create Crawl'
end
