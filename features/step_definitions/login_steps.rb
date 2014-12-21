Given(/^I am logged in$/) do
  User.create!(email: 'test_user@example.com', password: 'password') unless User.where(email: 'test_user@example.com').exists?

  application.visit_dashboard
  application.login_with_credentials(email: 'test_user@example.com', password: 'password')
end

Given(/^I have an account$/) do
  email = 'test_user@example.com'
  password = 'password'
  User.create!(email: email, password: password)
end

Given(/^I am not logged in$/) do; end

When(/^I logout$/) do
  application.primary_navigation.log_out
end

When(/^I login$/) do
  application.visit_dashboard
  application.login_with_credentials(email: 'test_user@example.com', password: 'password')
end

Then(/^I should be asked for my authentication credentials$/) do
  expect(application.primary_navigation).to_not have_log_out_button
  expect(application.primary_navigation.user_name).to be_blank
  expect(application.login_page).to have_log_in_button
  expect(page).to have_content 'Log in'
  expect(application.login_page.errors).to include 'You need to sign in or sign up before continuing.'
end

Then(/^I should see my dashboard$/) do
  expect(application.primary_navigation.user_name).to eq 'test_user@example.com'
  expect(application.primary_navigation).to have_log_out_button
  expect(application.dashboard_page.notifications).to include 'Signed in successfully.'
  expect(application.dashboard_page).to be_dashboard_page
end
