Given(/^I am on my owned items list page$/) do
  click_on 'My Items'
end

When(/^I add an item with the following details:$/) do |table|
  click_on 'Add Item'
  page.fill_in 'Name', with: table.rows_hash[:name]
  click_on 'Create'
end

When(/^I add an item with invalid details$/) do
  click_on 'Add Item'
  click_on 'Create'
end

Then(/^I am shown an error$/) do
  expect(page).to have_content "Name can't be blank"
end