Given(/^I am logged in$/) do
  User.create(email: 'test_user@example.com', password: 'password')
  visit root_path
  fill_in 'Email', with: 'test_user@example.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
end

Given(/^I have item (.*?)$/) do |item_name|
  Item.create!(name: item_name)
end

When(/^I navigate to item list$/) do
  click_link 'My Items'
end

Then(/^I am shown (.*?) in my owned items list$/) do |item_name|
  expect(page).to have_content item_name
end