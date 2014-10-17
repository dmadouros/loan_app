Given(/^user:$/) do |user_table|
  @user = user_table.hashes[0]
  User.create(email: @user['email'], password: @user['password'])
end

When(/^user "(.*?)" logs in$/) do |user_name|
  visit root_path
  fill_in 'Email', with: @user['email']
  fill_in 'Password', with: @user['password']
  click_button 'Log in'
end

Then(/^system takes them to landing page$/) do
  expect(page).to have_css'.user_name', text: @user['email']
  expect(page).to have_link 'Log out'
  expect(page).to have_content 'Hey there'
  expect(page).to have_content 'Signed in successfully.'
end

Given(/^user "(.*?)" is logged in$/) do |user_name|
  visit root_path
  fill_in 'Email', with: @user['email']
  fill_in 'Password', with: @user['password']
  click_button 'Log in'
end

When(/^user "(.*?)" logs out$/) do |user_name|
  click_link 'Log out'
end

Then(/^system takes them to log in page$/) do
  expect(page).to_not have_css'.user_name', text: @user['email']
  expect(page).to_not have_link 'Log out'
  expect(page).to have_content 'Log in'
  expect(page).to have_content 'You need to sign in or sign up before continuing.'
end