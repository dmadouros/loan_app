Given(/^I have item (.*?)$/) do |item_name|
  Item.create!(name: item_name)
end

Given(/^I am looking at my owned items$/) do
  application.list_my_items
end

When(/^I look at items that I own$/) do
  application.list_my_items
end

When(/^I try to look at items that I own$/) do
  ItemsListPage.new(page).open
end

When(/^I add an item with the following details:$/) do |table|
  application.my_items_page.add_item
  application.add_item(name: table.rows_hash[:name])
end

When(/^I add an item with invalid details$/) do
  application.my_items_page.add_item
  application.add_item(name: '')
end

Then(/^I should see (.*?) in my owned items$/) do |item_name|
  expect(application.my_items_page.items_names).to include item_name
end

Then(/^I should see an error$/) do
  expect(application.add_item_page).to have_error
end