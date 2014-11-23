Given(/^I have an account with the following details:$/) do |table|
  email = table.rows_hash[:email]
  password = table.rows_hash[:password]
  User.create!(email: email, password: password)
end

When(/^I bypass login and go to item list$/) do
  visit items_path
end